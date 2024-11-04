from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('increment/', views.increment_counter, name='increment_counter'),
    path('get/', views.get_counter_value, name='get_counter_value'),
]

