import json

from django.forms import model_to_dict
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

from topicos.models import SellerInventory


# Create your views here.

@csrf_exempt
def get_user_stock(request):
    if request.method != "POST":
        return HttpResponse("", status=400)

    post = json.loads(request.body)

    seller_email = post['email']
    # seller_email = request.POST['email']
    product = post['product']
    # product = request.POST['product']

    seller_product_inventory = SellerInventory.objects.filter(seller__email=seller_email, product__name=product).first()

    if not seller_product_inventory:
        return HttpResponse("", status=400)

    response_data = model_to_dict(seller_product_inventory)

    return HttpResponse(json.dumps(response_data), content_type="application/json")
