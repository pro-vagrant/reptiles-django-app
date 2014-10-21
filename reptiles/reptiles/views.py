from django.http import HttpResponse

from django.template.loader import get_template

from django.template import Context

def viper(request):
    t = get_template('viper.html')
    html = t.render(Context())
    return HttpResponse(html)

def turtle(request):
    t = get_template('turtle.html')
    html = t.render(Context())
    return HttpResponse(html)

def grass_snake(request):
    t = get_template('grass-snake.html')
    html = t.render(Context())
    return HttpResponse(html)
