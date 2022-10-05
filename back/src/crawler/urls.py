from django.urls import path

from . import views

urlpatterns = [
    path('', views.crawl, name='crawl'),
    path('api/v1/new', views.crawl, name='crawl'),
    path('api/v1/search', views.search, name='crawl'),
]