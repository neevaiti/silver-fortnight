from django.shortcuts import render
from django.contrib.auth.decorators import login_required

def index(request):
    return render(request, 'index.html')

@login_required
def hello(request):
    username = request.user.username
    return render(request, 'hello.html', {'username': username})