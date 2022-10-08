from django.contrib import admin
from orders.models import Order, OrderItem
# Register your models here.


class OrderItemTabuler(admin.TabularInline):
    model = OrderItem
    extra = 0
    raw_id_fields = ['course', ]


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ['user', 'total_price', 'status']
    list_filter = ['created', 'status']
    raw_id_fields = ['user']
    list_editable = ['status']
    inlines = [OrderItemTabuler]
    list_per_page = 24
