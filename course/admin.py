from django.contrib import admin
from course.models import Type_course, Course, Topic, Lesson

# Register your models here.
@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    list_display = ('name', 'type', 'price', 'created', 'updated')
    list_filter = ['created']
    search_fields = ['name']
    prepopulated_fields = {'slug': ('name',)}
    list_per_page = 24

@admin.register(Topic)
class TopicAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')
    list_per_page = 24

@admin.register(Lesson)
class LessonAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')
    list_per_page = 24

@admin.register(Type_course)
class TypeCourseAdmin(admin.ModelAdmin):
    list_display = ('name', 'created')
    list_per_page = 24