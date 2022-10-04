import requests
from bs4 import BeautifulSoup
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt


def get_data(nf_url):
    source_code = requests.get(nf_url)
    plain_text = source_code.text
    soup = BeautifulSoup(plain_text, features="html.parser")

    conteudo = "#iframeConteudo"

    for obj in soup.select(conteudo):
        a = obj.get('src')

    return second_req(a)


def second_req(url):
    source_code = requests.get(url)
    plain_text = source_code.text
    soup = BeautifulSoup(plain_text, features="html.parser")

    nf_data = []
    nf_data_struct = []

    for td in soup.find_all('td', {'class': 'borda-pontilhada-botton'}):
        nf_data.append(td.text)
        nf_data_struct.append(td)

    return nf_data_struct


def build_header(header_data):
    return "{}".format(header_data)


def build_products(products_data):
    return "{}".format(products_data)


def get_products(nf_data):
    header = build_header(nf_data[0])
    products = build_products(nf_data[2])
    total = build_products(nf_data[3])

    html = "{}<br>{}<br>{}".format(header, products, total)

    return html


@csrf_exempt
def crawl(request):

    url = "https://www.sefaz.rs.gov.br/NFCE/NFCE-COM.aspx" \
          "?chNFe=43171192665611010130650010003475031829326215" \
          "&nVersao=100" \
          "&tpAmb=1" \
          "&cDest=00709044054" \
          "&dhEmi=323031372d31312d31375432323a32303a33392d30323a3030" \
          "&vNF=51.93" \
          "&vICMS=0.00" \
          "&digVal=6237455657592b536b796964503742596a68514677694a414d6e553d&" \
          "cIdToken=000001&cHashQRCode=7D7C47D3873949E3E3B3512DC0DBE9F1748F3111"

    url1 = "https://www.sefaz.rs.gov.br/NFCE/NFCE-COM.aspx" \
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
        url = request.POST['url']

    response = get_data(url)

    return HttpResponse(get_products(response))
