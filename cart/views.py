from django.shortcuts import render, get_object_or_404, redirect
from cart.cart import Cart
from course.models import Course
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_POST
from cart.forms import CartForm
# Create your views here.


@login_required
@require_POST
def add_to_cart(request):
    cart = Cart(request)
    form = CartForm(request.POST)
    if form.is_valid():
        course_id = form.cleaned_data['course_id']
        course = get_object_or_404(Course, id=course_id)
        cart.add(course_id, course.price)
        messages.success(request, f'{course.name} đã được thêm vào giỏ hàng.')
    return redirect('cart:cart_details')

@login_required
def cart_details(request):
    cart = Cart(request)
    courses = Course.objects.filter(pk__in=cart.cart.keys())
    total_price = 0
    for i in courses:
        total_price += i.price
    return render(request, 'cart/cart_details.html', {'cart_items': courses, 'total_price': total_price})


@login_required
def remove_from_cart(request, id):
    cart = Cart(request)
    cart.remove(str(id))
    return redirect('cart:cart_details')


@login_required
def clear_cart(request):
    cart = Cart(request)
    cart.clear()
    return redirect('cart:cart_details')
