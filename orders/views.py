from django.shortcuts import render, redirect, Http404
from django.views import generic
from orders.forms import OrderForm
from orders.models import Order, OrderItem
from cart.cart import Cart
from django.db.models import Count
from course.models import Course
from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import User
# Create your views here.

class CreateOrder(LoginRequiredMixin, generic.CreateView):
    template_name = 'orders/place_order.html'
    form_class = OrderForm
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        cart = Cart(self.request)
        courses = Course.objects.filter(pk__in=cart.cart.keys())
        cart_items = map(
            lambda p: {'course': p,'total': p.price}, courses)
        context['summary'] = cart_items
        return context

    def form_valid(self, form):
        user_id = self.request.user
        cart = Cart(self.request)
        order = form.save(commit=False)
        order.user = self.request.user
        order.total_price = cart.get_total_price()
        order.save()
        courses = Course.objects.filter(id__in=cart.cart.keys())
        orderitems = []
        for course_item in courses:
            orderitems.append(OrderItem(order=order, course=course_item, total=course_item.price, user = user_id, course_name = course_item.name, course_slug = course_item.slug, course_img = course_item.image ))
        OrderItem.objects.bulk_create(orderitems)
        cart.clear()
        messages.success(self.request, 'Đặt hàng thành công.')
        return redirect('course:courselist')


class MyOrders(LoginRequiredMixin, generic.ListView):
    model = Course,Order, OrderItem
    template_name = 'orders/order_list.html'
    context_object_name = 'course_list'
    paginate_by = 10

    def get_queryset(self):
        course_list =  OrderItem.objects.filter(user = self.request.user)
        return course_list

class OrderDetails(LoginRequiredMixin, generic.DetailView):
    model = Order
    context_object_name = 'order'
    template_name = 'orders/order_details.html'

    def get_queryset(self, **kwargs):
        objs = super().get_queryset(**kwargs)
        return objs.filter(user=self.request.user).prefetch_related('items', 'items__product')

class OrderInvoice(LoginRequiredMixin, generic.DetailView):
    model = Order
    context_object_name = 'order'
    template_name = 'orders/order_invoice.html'

    def get_queryset(self):
        qs = super().get_queryset()
        return qs.prefetch_related('items', 'items__product')

    def get_object(self, **kwargs):
        obj = super().get_object(**kwargs)
        if obj.user_id == self.request.user.id or self.request.user.is_superuser:
            return obj
        raise Http404
    
    # def payment(request):
    #     if request.method == 'POST':
    #         # Process input data and build url payment
    #         form = PaymentForm(request.POST)
    #         if form.is_valid():
    #             order_type = form.cleaned_data['order_type']
    #             order_id = form.cleaned_data['order_id']
    #             amount = form.cleaned_data['amount']
    #             order_desc = form.cleaned_data['order_desc']
    #             bank_code = form.cleaned_data['bank_code']
    #             language = form.cleaned_data['language']
    #             ipaddr = get_client_ip(request)
    #             # Build URL Payment
    #             vnp = vnpay()
    #             vnp.requestData['vnp_Version'] = '2.1.0'
    #             vnp.requestData['vnp_Command'] = 'pay'
    #             vnp.requestData['vnp_TmnCode'] = settings.VNPAY_TMN_CODE
    #             vnp.requestData['vnp_Amount'] = amount * 100
    #             vnp.requestData['vnp_CurrCode'] = 'VND'
    #             vnp.requestData['vnp_TxnRef'] = order_id
    #             vnp.requestData['vnp_OrderInfo'] = order_desc
    #             vnp.requestData['vnp_OrderType'] = order_type
    #             # Check language, default: vn
    #             if language and language != '':
    #                 vnp.requestData['vnp_Locale'] = language
    #             else:
    #                 vnp.requestData['vnp_Locale'] = 'vn'
    #                 # Check bank_code, if bank_code is empty, customer will be selected bank on VNPAY
    #             if bank_code and bank_code != "":
    #                 vnp.requestData['vnp_BankCode'] = bank_code

    #             vnp.requestData['vnp_CreateDate'] = datetime.now().strftime('%Y%m%d%H%M%S')
    #             vnp.requestData['vnp_IpAddr'] = ipaddr
    #             vnp.requestData['vnp_ReturnUrl'] = settings.VNPAY_RETURN_URL
    #             vnpay_payment_url = vnp.get_payment_url(settings.VNPAY_PAYMENT_URL, settings.VNPAY_HASH_SECRET_KEY)
    #             print(vnpay_payment_url)
    #                 # Redirect to VNPAY
    #                 return redirect(vnpay_payment_url)
    #         else:
    #             print("Form input not validate")
    #     else:
    #         return render(request, "payment.html", {"title": "Thanh toán"})
    #         // vui lòng tham khảo thêm tại code demo
