class mysql {
  # Installs the MySQL server and MySQL client
  package { "mysql-server":
    name   => "mysql-server",
    ensure => installed,
  }

  package { 'mysql-client':
    name   => "mysql-client",
    ensure => installed,
  }

  # Ensures the MySQL service is running
  service { 'mysql':
    ensure  => running,
    require => Package["mysql-server"],
  }
}
