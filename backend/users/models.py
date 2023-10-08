from django.db import models

class UserLocation(models.Model):
    latitude = models.FloatField()
    longitude = models.FloatField()

class Fire(models.Model):
    country_id = models.CharField(max_length=10)
    latitude = models.FloatField()
    longitude = models.FloatField()
    acq_date = models.DateField()
    acq_time = models.TimeField()