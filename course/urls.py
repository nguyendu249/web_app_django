from django.urls import path
from . import views

app_name = 'course'

urlpatterns = [
    path('', views.CourseList.as_view(), name='courselist'),
    path('<slug:slug>/',views.CourseDetails, name='course_details'),
    path('learn/<slug:slug>/',views.LearnCourse, name='learn'),
    path('<int:course_id>/lecture/<int:id>/',views.LeesonView, name='learn_view')
]