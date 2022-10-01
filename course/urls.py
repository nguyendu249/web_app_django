from django.urls import path
from . import views

app_name = 'course'

urlpatterns = [
    path('', views.CourseList, name='courselist'),
    path('<slug:slug>/',views.CourseDetails, name='course_details'),
    path('learn/<slug:slug>/',views.LearnCourse, name='learn')
]