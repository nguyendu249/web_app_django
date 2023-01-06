from django.urls import path
from django.conf.urls import url
from orders import views

app_name = 'orders'
urlpatterns = [
    # url(r'^payment$', views.payment, name='payment'),
    path('payment', views.payment, name='courselist'),
    path('place', views.CreateOrder.as_view(), name='place'),
    path('my-course', views.MyOrders.as_view(), name='my_course'),
    path('details/<int:pk>/', views.OrderDetails.as_view(), name='details'),
    path('invoice/<int:pk>/', views.OrderInvoice.as_view(), name='invoice')
]
