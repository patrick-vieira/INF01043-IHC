from django.contrib import admin

from topicos.models import SellerInventory, Seller, Product


class SellerInventoryAdmin(admin.ModelAdmin):
    list_display = ('seller', 'product', 'quantity')

    def save_model(self, request, obj, form, change):
        super().save_model(request, obj, form, change)


class SellerAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', )

    def save_model(self, request, obj, form, change):
        super().save_model(request, obj, form, change)

class ProductAdmin(admin.ModelAdmin):
    list_display = ('name',)

    def save_model(self, request, obj, form, change):
        super().save_model(request, obj, form, change)


# Register your models here.
admin.site.register(SellerInventory, SellerInventoryAdmin)
admin.site.register(Seller, SellerAdmin)
admin.site.register(Product, ProductAdmin)
