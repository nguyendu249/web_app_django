from django.urls import path, include
from accounts import views
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('', include('django.contrib.auth.urls')),
    path('register', views.Register.as_view(), name='register'),
    path('profile', views.profile, name='profile'),
]
