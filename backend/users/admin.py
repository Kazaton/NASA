from django.contrib import admin
from .models import UserLocation

@admin.register(UserLocation)
class UserLocationAdmin(admin.ModelAdmin):
    list_display = ('id', 'latitude', 'longitude')