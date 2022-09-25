from email.mime import image
from msilib import type_short
from statistics import mode
from tkinter.tix import Tree
from unicodedata import name
from django.db import models
from django.urls import reverse
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from autoslug import AutoSlugField

# Create your models here.

types = (
    ('Free', 'Free'),
    ('Paid', 'Paid')
)
class Type_course(models.Model):
    name = models.CharField(max_length=150,blank=False, null=False)
    slug = AutoSlugField(populate_from='name',unique_with=['created'])
    created = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name ="Danh mục khóa học"
        verbose_name_plural ="Danh mục khóa học"

    def get_absolute_path(self):
        return reverse('course:course_list') + f'?type_course={self.id}'

    def __str__(self):
        return self.name

class Course(models.Model):
    type_course = models.ForeignKey(Type_course, on_delete=models.CASCADE,related_name='courses') #Nếu type course bị xóa thì Course cũng sẽ bị xoá
    name = models.CharField(max_length=1500,blank=False, null=False)
    slug = AutoSlugField(populate_from='name',unique_with=['created'])
    description = RichTextUploadingField()
    type = models.CharField(max_length=1500,choices=types, default='Free')
    price = models.IntegerField(default=0)
    image = models.ImageField(upload_to='media/course/%Y/%m/%d/', blank=False)
    video_intro = models.CharField(max_length=1500,default='')
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)


    class Meta:
        verbose_name ="Khóa học"
        verbose_name_plural ="Khóa học"
        index_together = ('id', 'slug')
        ordering = ('-created',)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('course:course_details', kwargs={'slug': self.slug})

class Topic(models.Model):
    course = models.ForeignKey(Course,on_delete=models.CASCADE,related_name='topics')
    name = models.CharField(max_length=150,blank=False, null=False)
    slug = AutoSlugField(populate_from='name',unique_with=['created'])
    description = RichTextUploadingField(blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name ="Chủ đề"
        verbose_name_plural ="Chủ đề"
        index_together = ('id', 'slug')
        ordering = ('-created',)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('course:course_details', kwargs={'slug': self.slug})

class Lesson(models.Model):
    verbose_name ="Bài học"
    verbose_name_plural ="Bài học"
    topic = models.ForeignKey(Topic, on_delete=models.CASCADE,related_name='lessons')
    name = models.CharField(max_length=150,blank=False, null=False)
    slug = AutoSlugField(populate_from='name',unique_with=['created'])
    description = RichTextUploadingField()
    video = models.CharField(max_length=150,blank=False, null=False)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        index_together = ('id', 'slug')
        ordering = ('-created',)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('course:course_details', kwargs={'slug': self.slug})