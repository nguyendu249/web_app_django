from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from course.models import Course, Lesson, Topic
from orders.models import OrderItem
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views import generic
from django.db.models import Count

# Create your views here.
class CourseList(generic.ListView):
    model = Course
    paginate_by = 10
    context_object_name = 'Courses'
    template_name = 'course_list.html'

    def get_queryset(self):
        Courses = Course.objects.all().order_by('created')
        return Courses

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

def CourseDetails(request, slug):
    status = 0
    course = Course.objects.get(slug=slug)
    order_item = OrderItem.objects.filter(user=request.user)
    
    for item in order_item:
        if course.id == item.course_id:
            status = 1

    # Lấy tổng số bài học (lessons) và tổng số chủ đề (topics)
    total_lessons = Lesson.objects.filter(topic__course=course).count()
    total_topics = Topic.objects.filter(course=course).count()

    return render(request, 'course_details.html', {'course': course, 'status': status, 'total_lessons': total_lessons, 'total_topics': total_topics})

@login_required
def LearnCourse(request, slug):
    authUser = 0
    course = Course.objects.get(slug = slug)
    topics = Topic.objects.filter(course_id = course.id).order_by('id')
    #lấy tất cả các lesson
    lesson_aray = []
    for topic in topics:
        for item in Lesson.objects.filter(topic_id = topic.id).order_by('id'):
            lesson_aray.append(item)
    first_lesson = lesson_aray[0]
    #Kiểm tra khóa học có đc mua hay chưa
    order_item = OrderItem.objects.filter(user = request.user)
    for item in order_item:
        if course.id == item.course_id:
            authUser = 1
    
    return render(request,'course_learn.html',
        {'course' : course,
        'topics' : topics,
        'lessons' : lesson_aray,
        'first_lesson' : first_lesson,
        'status' : authUser

    })

def LeesonView(request,course_id ,id ):
    course = Course.objects.get(id = course_id)
    topics = Topic.objects.filter(course_id = course.id).order_by('id')
    #lấy tất cả các lesson
    lesson_aray = []
    for topic in topics:
        for item in Lesson.objects.filter(topic_id = topic.id).order_by('id'):
            lesson_aray.append(item)
            if item.id == id:
                lesson_select = item
    
    #Kiểm tra khóa học có đc mua hay chưa
    order_item = OrderItem.objects.filter(user = request.user)
    for item in order_item:
        if course.id == item.course_id:
            authUser = 1
    
    first_lesson = lesson_select
    return render(request,'course_learn.html',
        {'course' : course,
        'topics' : topics,
        'lessons' : lesson_aray,
        'first_lesson' : first_lesson,
        'status' : authUser
    })