# Setups a default virtual host that serves a phpinfo page,
class webserver {
  file { '/etc/apache2/sites-enabled/example.dev':
    path    => '/etc/apache2/sites-enabled/example.dev',
    source  => 'puppet:///modules/webserver/site.conf',
    notify  => Service['apache2'],
    require => Package['apache2'],
  }
}
