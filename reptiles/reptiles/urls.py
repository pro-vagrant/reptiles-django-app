from django.conf.urls import patterns, include, url

from reptiles.views import viper
from reptiles.views import turtle
from reptiles.views import grass_snake

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',

    url(r'^$', viper, name='viper-url'),

    url(r'^turtle\.html$', turtle, name='turtle-url'),

    url(r'^grass-snake\.html$', grass_snake, name='grass-snake-url'),
)

