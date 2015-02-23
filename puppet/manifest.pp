include django_app

django_app::vhost { 'reptiles.lh':
    docroot => '/vagrant/reptiles/reptiles'
    #docroot => '/home/vagrant/reptiles-django-app/reptiles/reptiles'
}