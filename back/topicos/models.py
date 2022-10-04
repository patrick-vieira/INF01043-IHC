from django.db import models


# Create your models here.

class Seller(models.Model):
    class Meta:
        verbose_name = 'Seller'
        verbose_name_plural = 'Sellers'
        ordering = ['email', ]

    name = models.CharField(max_length=100, null=False, blank=False)
    email = models.EmailField(max_length=254)

    def __str__(self):
        return self.name


class Product(models.Model):
    class Meta:
        verbose_name = 'Product'
        verbose_name_plural = 'Products'
        ordering = ['name', ]

    name = models.CharField(max_length=100, null=False, blank=False)

    def __str__(self):
        return self.name


class SellerInventory(models.Model):
    class Meta:
        verbose_name = 'Seller Inventory'
        verbose_name_plural = 'Sellers Inventories'
        ordering = ['seller', 'product']
        unique_together = [['seller', 'product']]

    seller = models.ForeignKey(Seller, on_delete=models.CASCADE, verbose_name='Seller')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, verbose_name='Product')
    quantity = models.IntegerField(verbose_name='Quantity')

    def __str__(self):
        return '{} - {} / {}'.format(self.seller, self.product, self.quantity)
