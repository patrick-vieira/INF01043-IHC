import json
import re
from datetime import datetime
from locale import localize

import pytz
import requests
from bs4 import BeautifulSoup
from django.core import serializers
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from lxml import etree

from crawler.models import Product


def resolve_url(nf_url):
    source_code = requests.get(nf_url)
    plain_text = source_code.text
    soup = BeautifulSoup(plain_text, features="html.parser")

    conteudo = "#iframeConteudo"

    for obj in soup.select(conteudo):
        resolved_url = obj.get('src')

    return resolved_url


def clear_string(to_fix):
    first = str(to_fix).strip().replace('\n', '').replace('\r', '')
    second = re.sub(' +', ' ', first)

    return second


def parse_date(date):
    string_date = date.split("Data de Emissão:")[1].strip()
    datetime_object = datetime.strptime(string_date, '%d/%m/%Y %H:%M:%S')
    utc = pytz.UTC

    return utc.localize(datetime_object)


def parse_products(resolved_url):
    HEADERS = ({
        'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36',
        'Accept-Language': 'en-US, en;q=0.5'})

    webpage = requests.get(resolved_url, headers=HEADERS)
    soup = BeautifulSoup(webpage.content, "html.parser")

    dom = etree.HTML(str(soup))

    title_path = '//*[@id="respostaWS"]/tr/td/table/tr[3]/td/table/tr/td/table/tr[1]/td/table[1]/tr[1]/td[2]'
    address_path = '//*[@id="respostaWS"]/tr/td/table/tr[3]/td/table/tr/td/table/tr[1]/td/table[2]/tr/td'
    date_path = '//*[@id="respostaWS"]/tr/td/table/tr[3]/td/table/tr/td/table/tr[3]/td/table/tr[1]/td'

    shop = clear_string(dom.xpath(title_path)[0].text)
    address = clear_string(dom.xpath(address_path)[0].text)
    date = parse_date(clear_string(dom.xpath(date_path)[0].text))

    products = []
    product_count = 1

    new_products_count = 0
    updated_products_count = 0

    while True:
        product_line = dom.xpath('//*[@id="Item + {}"]'.format(product_count))

        if not product_line:
            break

        product_count += 1

        product = Product.objects.filter(id=int(product_line[0][0].text))

        if product.exists():
            product = product.first()

            if product.lastDate <= date:
                product.price = float(product_line[0][4].text.replace(',', '.'))
                product.lastDate = date
                product.shop = shop
                product.address = address
                updated_products_count += 1
        else:
            product = Product(id=int(product_line[0][0].text),
                              name=product_line[0][1].text,
                              type=product_line[0][3].text,
                              price=float(product_line[0][4].text.replace(',', '.')),
                              shop=shop,
                              address=address,
                              lastDate=date)
            new_products_count += 1

        product.save()

        products.append(product)

    return {
        'updated': updated_products_count,
        'new': new_products_count,
    }


def scrape_url(url):
    resolved_url = resolve_url(url)
    result = parse_products(resolved_url)

    return result


@csrf_exempt
def crawl(request):
    url1 = "https://www.sefaz.rs.gov.br/NFCE/NFCE-COM.aspx" \
           "?chNFe=43171192665611010130650010003475031829326215" \
           "&nVersao=100" \
           "&tpAmb=1" \
           "&cDest=00709044054" \
           "&dhEmi=323031372d31312d31375432323a32303a33392d30323a3030" \
           "&vNF=51.93" \
           "&vICMS=0.00" \
           "&digVal=6237455657592b536b796964503742596a68514677694a414d6e553d&" \
           "cIdToken=000001&cHashQRCode=7D7C47D3873949E3E3B3512DC0DBE9F1748F3111"

    url = "https://www.sefaz.rs.gov.br/NFCE/NFCE-COM.aspx" \
          "?chNFe=43171107718633001665650070003074121007074121" \
          "&nVersao=100" \
          "&tpAmb=1" \
          "&dhEmi=323031372d31312d32355431363a35313a32362d30323a3030" \
          "&vNF=112.77" \
          "&vICMS=0.55" \
          "&digVal=6f466f466c316b432f6e4f454b72453959434a4d7a5a51726941493d" \
          "&cIdToken=000001" \
          "&cHashQRCode=09AE0A5F19114F491F406DDDD96F13D33434AA5B"

    if request.method == "POST":
        post_body = json.loads(request.body)
        url = post_body['url']

    result = scrape_url(url)

    return HttpResponse(json.dumps(result), content_type="application/json")


def search(request):
    search_term = request.GET.get('search', None)

    if search_term:
        results = Product.objects.filter(name__icontains=search_term)
    else:
        results = Product.objects.all()

    data = serializers.serialize('json', list(results), fields=('name', 'type', 'price', 'shop', 'address', 'lastDate'))

    return HttpResponse(data, content_type="application/json")


def web(request):
    return HttpResponse("data", content_type="application/json")
