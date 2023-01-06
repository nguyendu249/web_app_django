from django.urls import path
from . import views

app_name = 'blog'

urlpatterns = [
    path('', views.index, name='blog_list'),
    path('<slug:slug>/',views.Blogdetails, name='blog_details'),
]