class webserver {
  $filepath = $::osfamily ? {
    redhat  => '/etc/httpd/conf.d/example.com.conf',
    debian  => '/etc/apache2/sites-enabled/example.com',
    default => undef
  }

  # Setups the virtual host
  file { '/etc/apache2/sites-enabled/example.com':
    path    => $filepath,
    source  => 'puppet:///modules/webserver/site.conf',
    notify  => Service['apache2'],
    require => Package['apache2'],
  }
}
