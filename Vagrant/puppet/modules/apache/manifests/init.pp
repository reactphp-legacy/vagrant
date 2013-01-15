class apache {
  $packageName = $::osfamily ? {
    debian  => 'apache2-mpm-prefork',
    redhat  => 'httpd',
    default => undef
  }

  # Ensures Apache2 is installed
  package { 'apache2':
    name   => $packageName,
    ensure => installed,
  }

  $serviceName = $::osfamily ? {
    debian  => 'apache2',
    redhat  => 'httpd',
    default => undef
  }

  # Ensures the Apache service is running
  service { 'apache2':
    name    => $serviceName,
    ensure  => running,
    require => Package['apache2'],
  }
}
