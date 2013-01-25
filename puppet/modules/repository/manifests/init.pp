class repository {
  exec {"/usr/bin/add-apt-repository ppa:ondrej/php5 && /usr/bin/apt-get update":
      alias   => "php54_repository",
      require => Package["python-software-properties"],
      before  => Package['php']
  }
  package {"python-software-properties":
      ensure => installed
  }
}
