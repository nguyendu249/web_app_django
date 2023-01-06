from django.shortcuts import render
from course.models import Course
from blog.models import Blog
# Create your views here.
def HomePageView(request):
    Courses = Course.objects.all().order_by('created')[:10]
    blogs = Blog.objects.all().order_by('created')[:3]
    return render(request,'index.html', {'Courses' : Courses, 'blogs' : blogs})
