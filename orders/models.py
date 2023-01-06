from statistics import mode
from django.db import models
from django.conf import settings
from course.models import Course
from django.shortcuts import reverse

# Create your models here.

choices = (
    ('0', 'Chưa thanh toán'),
    ('1', 'Đã thanh toán'),
)

class Order(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL,related_name='orders', on_delete=models.CASCADE)
    name = models.CharField(verbose_name = "Tên",max_length=50,blank=False, null=False)
    phone = models.CharField(verbose_name = "Số điện thoại",max_length=15,blank=False, null=False)
    status = models.CharField(verbose_name = "Trạng thái",choices=choices, max_length=10, default='0')
    total_price = models.FloatField(verbose_name = "Tổng tiền",null=False, blank=False)
    created = models.DateTimeField(verbose_name = "Ngày tạo",auto_now_add=True)
    updated = models.DateTimeField(verbose_name = "Ngày chỉnh sửa gần nhất",auto_now=True)


    class Meta:
        ordering = ('-created',)

    def __str__(self):
        return f'Order {self.id}'

    def get_absolute_url(self):
        return reverse('orders:invoice', kwargs={'pk': self.pk})


class OrderItem(models.Model):
    order = models.ForeignKey(Order, related_name='items', on_delete=models.CASCADE)
    course = models.ForeignKey(Course, related_name='ordered', on_delete=models.CASCADE)
    course_name = models.CharField(max_length=150,blank=False, null=False)
    course_slug = models.CharField(max_length=150,blank=False, null=False)
    course_price = models.FloatField(null=True, blank=True)
    course_img = models.CharField(max_length=150,blank=False, null=False)
    total = models.FloatField(null=False, blank=False)
    user = models.ForeignKey(settings.AUTH_USER_MODEL,related_name='orders_item', on_delete=models.CASCADE)
    def __str__(self):
        return f'Order Item {self.id}'
