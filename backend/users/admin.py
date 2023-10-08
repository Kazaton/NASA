from django.contrib import admin
from .models import UserLocation, Fire

@admin.register(UserLocation)
class UserLocationAdmin(admin.ModelAdmin):
    list_display = ('id', 'latitude', 'longitude')

@admin.register(Fire)
class FireAdmin(admin.ModelAdmin):
    list_display = ('country_id', 'latitude', 'longitude', 'acq_date', 'acq_time')