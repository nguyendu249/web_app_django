from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField
from autoslug import AutoSlugField
# Create your models here.
class Blog(models.Model):
    title = models.CharField(verbose_name = "Tên tin tức",max_length=150,blank=False, null=False)
    slug = AutoSlugField(populate_from='title',unique_with=['created'])
    description = RichTextUploadingField(verbose_name = "Mô tả")
    image = models.ImageField(upload_to='media/course/%Y/%m/%d/', blank=False)
    created = models.DateTimeField(verbose_name = "Ngày tạo",auto_now_add=True)
    updated = models.DateTimeField(verbose_name = "Ngày chỉnh sửa gần nhất",auto_now=True)

    class Meta:
        verbose_name ="Tin tức"
        verbose_name_plural ="Tin tức"

    def __str__(self):
        return self.title