from django.db import models

class UserLocation(models.Model):
    latitude = models.FloatField()
    longitude = models.FloatField()
