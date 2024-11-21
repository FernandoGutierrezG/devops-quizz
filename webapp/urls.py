from django.urls import path
from . import views
from django.http import JsonResponse
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

def health_check(request):
    return JsonResponse({'status': 'ok'}, status=200)

urlpatterns = [
    path('', views.home, name='home'),
    path('increment/', views.increment_counter, name='increment_counter'),
    path('get/', views.get_counter_value, name='get_counter_value'),
    path('health/', health_check, name='health_check'),
]

urlpatterns += staticfiles_urlpatterns()