from django.urls import path
from . import views

app_name = 'home'

urlpatterns = [
    path('', views.CourseList, name='CourseList'),
    path('<slug:slug>/',views.CourseDetails, name='CourseDetails')

]