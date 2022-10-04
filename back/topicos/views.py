import json

from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt


# Create your views here.

@csrf_exempt
def get_user_stock(request):
    response_data = {
        "user": "pdsvieira@inf.ufrgs.br",
        "stock": [
            {
                "product": "5 Star 40g",
                "productId": "7750947012823",
                "quantity": 4
            },
            {
                "product": "Alpino 25g",
                "productId": "7750946750679",
                "quantity": 3
            },
            {
                "product": "Ao Leite 20g",
                "productId": "7743623463127",
                "quantity": 5
            },
            {
                "product": "Baton 16g",
                "productId": "7743605670103",
                "quantity": 8
            },
            {
                "product": "Bis Xtra 45g",
                "productId": "7750947143895",
                "quantity": 13
            }
        ]
    }

    return HttpResponse(json.dumps(response_data), content_type="application/json")
