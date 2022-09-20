from email.mime import image
from msilib import type_short
from statistics import mode
from unicodedata import name
from django.db import models
from django.urls import reverse

# Create your models here.

types = (
    ('Free', 'Free'),
    ('Paid', 'Paid')
)
class Type_course(models.Model):
    name = models.CharField(blank=False, null=False)
    created = models.DateTimeField(auto_now_add=True)

    def get_absolute_path(self):
        return reverse('course:course_list') + f'?type_course={self.id}'

    def __str__(self):
        return self.name

class Course(models.Model):
    type_course = models.ForeignKey(Type_course, on_delete=models.CASCADE,related_name='courses') #Nếu type course bị xóa thì Course cũng sẽ bị xoá
    name = models.CharField(blank=False, null=False)
    slug = models.SlugField(unique_for_date='created')
    description = models.CharField(blank=False, null=False)
    type = models.CharField(types=types, default='Free')
    price = models.IntegerField(default=0)
    image = models.ImageField(upload_to='media/course/%Y/%m/%d/', blank=False)

    class Meta:
        index_together = ('id', 'slug')
        ordering = ('-created',)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('course:course_details', kwargs={'slug': self.slug})

class Topic(models.Model):
    course = models.ForeignKey(Course,on_delete=models.CASCADE,related_name='topics')
    name = models.CharField(blank=False, null=False)
    description = models.CharField()

class Lesson(models.Model):
    topic = models.ForeignKey(Topic, on_delete=models.CASCADE,related_name='lessons')
    name = models.CharField(blank=False, null=False)
    description = models.CharField()
    video = models.CharField(blank=False, null=False)

