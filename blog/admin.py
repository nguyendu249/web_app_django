from django.contrib import admin
from blog.models import Blog
# Register your models here.

@admin.register(Blog)
class Blogs(admin.ModelAdmin):
    list_display = ('title', 'created')
    list_filter = ['title']
    search_fields = ['title']
    list_per_page = 24