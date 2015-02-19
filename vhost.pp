class {
  'apache':  default_vhost => false;
}


apache::vhost { 'wsgi.example.lh':
  port                        => '80',
  docroot                     => '/vagrant/reptiles/reptiles',
  wsgi_application_group      => '%{GLOBAL}',
  wsgi_daemon_process         => 'wsgi',
  wsgi_daemon_process_options => {
    python-path => '/vagrant/reptiles'
   },
  wsgi_import_script          => '/vagrant/reptiles',
  wsgi_import_script_options  =>
    { process-group => 'wsgi', application-group => '%{GLOBAL}' },
  wsgi_process_group          => 'wsgi',
  wsgi_script_aliases         => { '/' => '/vagrant/reptiles/reptiles/wsgi.py' },
}

$docroot = '/lorem/ipsum/dolor'
$project_name = inline_template('<%= @docroot.slice(/[^\/]+$/) -%>')
$project_path = inline_template('<%= @docroot.slice(/^\/[^\/]+\/[^\/]+/) -%>')
notify { "Project name: ${project_name}": }
notify { "Project path: ${project_path}": }

