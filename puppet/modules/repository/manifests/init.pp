# Adds a custom ppa for php 5.4 to the project
class repository {
  exec {"add-apt-repository ppa:ondrej/php5":
      alias   => "php54_repository",
      require => Package["python-software-properties"],
      before  => [Class['php_modules'], Package['php'], Package['php-pear'], Package['php-devel']]
  }
  exec {"apt-get update":
	  require => Exec['php54_repository'],
      before  => [Class['php_modules'], Package['php'], Package['php-pear'], Package['php-devel']]
  }
}
