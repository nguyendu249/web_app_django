from django.shortcuts import render
from course.models import Course, Lesson, Topic, Type_course
# Create your views here.

def CourseList(request):
    Courses = {'Courses' : Course.objects.all().order_by('created')}
    return render(request,'course_list.html', Courses)

def CourseDetails(request, slug):
    course = Course.objects.get(slug = slug)
    return render(request,'course_details.html', {'course' : course})

def LearnCourse(request, slug):
    course = Course.objects.get(slug = slug)
    topics = Topic.objects.filter(course_id = course.id).order_by('id')
    #lấy tất cả các lesson
    lesson_aray = []
    for topic in topics:
        for item in Lesson.objects.filter(topic_id = topic.id).order_by('id'):
            lesson_aray.append(item)
    first_lesson = lesson_aray[0]
    # lessons = Lesson.objects.all().order_by('id')
    # for topic in topics:
    #     for lesson in lessons:
    #         if lesson.topic_id == topic.id:
    #             lesson_aray.append(lesson)
    # lesson = Lesson.objects.filter(course_id = course.id).order_by('id').values()
    return render(request,'course_learn.html',
        {'course' : course,
        'topics' : topics,
        'lessons' : lesson_aray,
        'first_lesson' : first_lesson

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
    
    first_lesson = lesson_select
    return render(request,'course_learn.html',
        {'course' : course,
        'topics' : topics,
        'lessons' : lesson_aray,
        'first_lesson' : first_lesson

    })