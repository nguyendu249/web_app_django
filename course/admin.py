from django.contrib import admin
from course.models import Type_course, Course, Topic, Lesson
# from super_inlines.admin import SuperInlineModelAdmin, SuperModelAdmin
import nested_admin

# Register your models here.
@admin.register(Type_course)
class TypeCourseAdmin(admin.ModelAdmin):
    list_display = ('name', 'created')
    list_filter = ['name']
    search_fields = ['name']
    list_per_page = 24

class LesonInLine(nested_admin.NestedStackedInline):
    model = Lesson
    extra = 1
    ordering = ('created',)

class TopicInLine(nested_admin.NestedStackedInline):
    model = Topic
    fk_name = 'course'
    extra = 1
    ordering = ('created',)
    inlines = [LesonInLine,]
@admin.register(Course)
class CourseAdmin(nested_admin.NestedModelAdmin):
    display_name = 'Khóa học'
    list_display = ('name', 'type', 'price', 'created', 'updated')
    list_filter = ['type_course','created',]
    search_fields = ['name']
    inlines = [TopicInLine]
    list_per_page = 10


# @admin.register(Topic)
# class TopicAdmin(admin.ModelAdmin):
#     list_display = ('name', 'description','created', 'updated')
#     list_filter = ['name']
#     search_fields = ['name']
#     prepopulated_fields = {'slug': ('name',)}
#     list_per_page = 24

# @admin.register(Lesson)
# class LessonAdmin(admin.ModelAdmin):
#     list_display = ('name', 'description','created', 'updated')
#     list_filter = ['name']
#     search_fields = ['name']
#     prepopulated_fields = {'slug': ('name',)}
#     list_per_page = 24


