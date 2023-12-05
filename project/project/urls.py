from django.contrib import admin
from django.urls import path, include
from app import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index,name="index"),
    path("accounts/", include("django.contrib.auth.urls")), # intègre l'authentification
    path('accounts/profile/', views.hello,name="hello"), # redicrection après la page login
]