import json

from django.db import models


# Create your models here.

class Product(models.Model):
    class Meta:
        verbose_name = 'Product'
        verbose_name_plural = 'Products'
        ordering = ['name', 'type', 'price', 'shop', 'lastDate']

    id = models.BigIntegerField(verbose_name="Id", primary_key=True)
    name = models.CharField(max_length=255, null=False, blank=False, verbose_name="Name")
    type = models.CharField(max_length=100, null=False, blank=False)
    price = models.DecimalField(max_digits=5, decimal_places=2, null=False, blank=False)
    shop = models.CharField(max_length=255, null=False, blank=False)
    address = models.CharField(max_length=255, null=False, blank=False)
    lastDate = models.DateTimeField(verbose_name='Data do registro', auto_now_add=False, null=False, blank=False)

    def __str__(self):
        return '{} - {} | {}'.format(self.name, self.type, self.shop)

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__, sort_keys=True, indent=4)
