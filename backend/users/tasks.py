from celery import shared_task
from celery.utils.log import get_task_logger
from .models import Fire, UserLocation
import requests

logger = get_task_logger(__name__)
@shared_task(name='users.tasks.fetch-recent-fires')
def fetch_recent_fires():
    print("fetch_recent_fires task called!")
    try:
        logger.info("Started fetch_recent_fires task")
        url = "https://firms.modaps.eosdis.nasa.gov/api/country/csv/ddb2bd2d4d409c7188635b1fa0b23b9d/VIIRS_SNPP_NRT/KAZ/1/2023-10-07"
        response = requests.get(url)
        csv_data = response.text.splitlines()
        
        for row in csv_data[1:]:
            data = row.split(',')
            latitude = float(data[1])
            longitude = float(data[2])
            acq_date = data[6]
            acq_time = data[7]
            
            fire_exists = Fire.objects.filter(
                latitude=latitude, longitude=longitude,
                acq_date=acq_date, acq_time=acq_time
            ).exists()
            
            if not fire_exists:
                fire = Fire.objects.create(
                    country_id=data[0], latitude=latitude, longitude=longitude,
                    acq_date=acq_date, acq_time=acq_time
                )
                fire.save()
                for user_location in UserLocation.objects.all():
                    distance = calculate_distance(latitude, longitude, user_location.latitude, user_location.longitude)
                    if distance < 10:
                        print(f"User ID {user_location.id} is near a fire!")
        logger.info("Finished fetch_recent_fires task")
    except Exception as e:
        logger.error(f"Exception occurred: {e}")