from django.shortcuts import render
from blog.models import Blog
# Create your views here.
def index(request):
    all_blog = Blog.objects.all()
    return render(request,'blog_list.html', {'all_blog' : all_blog})

def Blogdetails(request, slug):
    blog = Blog.objects.get( slug = slug )
    # select * from bog where slug = slug
    return render(request,'blog_details.html',{'blog' : blog})


