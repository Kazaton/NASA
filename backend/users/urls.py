from django.urls import path
from .views import RegisterUserView, UserLocationUpdateView

urlpatterns = [
    path('register/', RegisterUserView.as_view(), name='register_user'),
    path('user/<int:pk>/', UserLocationUpdateView.as_view(), name='update_user_location'),
]