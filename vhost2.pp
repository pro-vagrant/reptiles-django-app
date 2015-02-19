class {
  'apache':  default_vhost => false;
}



$docroot = '/vagrant/reptiles/reptiles'
$domain = 'localhost.lh'

$project_name = inline_template('<%= @docroot.slice(/[^\/]+$/) -%>')
$project_path = inline_template('<%= @docroot.slice(/^\/[^\/]+\/[^\/]+/) -%>')
notify { "Project name: ${project_name}": }
notify { "Project path: ${project_path}": }

apache::vhost { "${domain}":
    port                        => '80',
    docroot                     => $docroot,
    wsgi_application_group      => '%{GLOBAL}',
    wsgi_daemon_process         => 'wsgi',
    wsgi_daemon_process_options => {
        python-path => $project_path
    },
    wsgi_import_script          => $project_path,
    wsgi_import_script_options  => {
        process-group => 'wsgi',
        application-group => '%{GLOBAL}'
    },
    wsgi_process_group          => 'wsgi',
    wsgi_script_aliases         => {
        '/' => "${docroot}/wsgi.py"
    },
}
