import os
from celery import Celery
from datetime import timedelta

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')
app = Celery('backend')

app.config_from_object('django.conf:settings', namespace='CELERY')

app.conf.timezone = 'Asia/Almaty'

app.conf.beat_schedule = {
    "fetch_recent_fires": {
        "task": "users.tasks.fetch-recent-fires",
        "schedule": timedelta(seconds=30),
    },
}

app.autodiscover_tasks()