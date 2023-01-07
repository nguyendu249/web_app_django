from django.contrib import admin

# Register your models here.
from vnpay.models import Payment
# Register your models here.

@admin.register(Payment)
class Payment(admin.ModelAdmin):
    list_display = ('vnp_TxnRef', 'vnp_Amount', 'vnp_BankCode','vnp_ResponseCode')
    list_filter = ['vnp_TxnRef']
    search_fields = ['vnp_TxnRef']
    list_per_page = 24