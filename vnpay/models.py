from django.db import models

# Create your models here.
class Payment(models.Model):
    vnp_TxnRef = models.CharField(verbose_name = "Mã đơn hàng",max_length=150,blank=False, null=False)
    vnp_Amount = models.CharField(verbose_name = "Tổng đơn hàng",max_length=150,blank=False, null=False)
    vnp_BankCode = models.CharField(verbose_name = "Ngân hàng",max_length=150,blank=False, null=False)
    vnp_BankTranNo = models.CharField(verbose_name = "Mã giao dịch",max_length=150,blank=False, null=False)
    vnp_CardType = models.CharField(verbose_name = "Loại thanh toán",max_length=150,blank=False, null=False)
    vnp_OrderInfo = models.CharField(verbose_name = "Thông tin thanh toán",max_length=150,blank=False, null=False)
    vnp_PayDate = models.CharField(verbose_name = "Ngày thanh toán",max_length=150,blank=False, null=False)
    vnp_ResponseCode = models.CharField(verbose_name = "Mã Trả về",max_length=150,blank=False, null=False)

    created = models.DateTimeField(verbose_name = "Ngày tạo",auto_now_add=True)
    updated = models.DateTimeField(verbose_name = "Ngày chỉnh sửa gần nhất",auto_now=True)

    class Meta:
        verbose_name ="Danh sách hóa đơn thanh toán"
        verbose_name_plural ="Danh sách hóa đơn thanh toán"


    def __str__(self):
        return self.vnp_TxnRef