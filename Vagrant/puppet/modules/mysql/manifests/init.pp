class mysql {
  $packageName = $::osfamily ? {
    debian  => 'mysql',
    redhat  => 'MySQL',
    default => undef
  }

  # Installs the MySQL server and MySQL client
  package { "mysql-server":
    name   => "${packageName}-server",
    ensure => installed,
  }

  package { 'mysql-client':
    name   => "${packageName}-client",
    ensure => installed,
  }

  # Ensures the MySQL service is running
  service { 'mysql':
    ensure  => running,
    require => Package["mysql-server"],
  }
}
