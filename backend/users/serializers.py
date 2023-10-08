from rest_framework import serializers
from .models import UserLocation, Fire

class UserLocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserLocation
        fields = ('id', 'latitude', 'longitude')

class FireSerializer(serializers.ModelSerializer):
    class Meta:
        model = Fire
        fields = ('country_id', 'latitude', 'longitude', 'acq_date', 'acq_time')