from django.contrib import admin

from crawler.models import Product


# Register your models here.

class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'type', 'price', 'shop', 'lastDate', )

    def save_model(self, request, obj, form, change):
        super().save_model(request, obj, form, change)


# Register your models here.
admin.site.register(Product, ProductAdmin)
