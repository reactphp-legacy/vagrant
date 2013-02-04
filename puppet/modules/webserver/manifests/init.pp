# Setups a default virtual host that serves a phpinfo page,
class webserver {
  file { '/etc/apache2/sites-enabled/example.com':
    path    => '/etc/apache2/sites-enabled/example.com',
    source  => 'puppet:///modules/webserver/site.conf',
    notify  => Service['apache2'],
    require => Package['apache2'],
  }
}
