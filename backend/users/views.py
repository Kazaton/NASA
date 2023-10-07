from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.generics import RetrieveUpdateAPIView
from rest_framework import status
from .models import UserLocation
from .serializers import UserLocationSerializer

class UpdateLocationView(APIView):
    def post(self, request):
        serializer = UserLocationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return response.Response(serializer.data, status=status.HTTP_201_CREATED)
        return response.Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class RegisterUserView(APIView):
    def post(self, request):
        serializer = UserLocationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class UserLocationUpdateView(RetrieveUpdateAPIView):
    queryset = UserLocation.objects.all()
    serializer_class = UserLocationSerializer

    def update(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.latitude = request.data.get("latitude")
        instance.longitude = request.data.get("longitude")
        instance.save()

        serializer = self.get_serializer(instance)
        return Response(serializer.data)
