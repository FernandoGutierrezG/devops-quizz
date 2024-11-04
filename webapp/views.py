from django.shortcuts import render, redirect
from .models import Counter
from django.http import HttpResponse
from django.http import JsonResponse

def initialize_counter():
    if Counter.objects.count() == 0:
        Counter.objects.create(value=0)

def home(request):
    initialize_counter()
    counter = Counter.objects.first()
    return render(request, 'home.html', {'counter': counter.value})

def increment_counter(request):
    if request.method == "POST":
        counter = Counter.objects.first()
        counter.value += 1
        counter.save()
        return JsonResponse({'counter': counter.value})

def get_counter_value(request):
    counter = Counter.objects.first()
    return JsonResponse({'counter': counter.value})
