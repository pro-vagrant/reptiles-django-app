VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.box = "tmp-django-v0.1.0"
    config.vm.network :forwarded_port, guest: 8000, host: 8880

end
