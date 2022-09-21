from django.shortcuts import render
from course.models import Course, Lesson, Topic, Type_course
# Create your views here.

def CourseList(request):
    Courses = {'Courses' : Course.objects.all().order_by('created')}
    return render(request,'course_list.html', Courses)

def CourseDetails(request, slug):
    course = Course.objects.get(slug = slug)
    return render(request,'course_details.html', {'course' : course})