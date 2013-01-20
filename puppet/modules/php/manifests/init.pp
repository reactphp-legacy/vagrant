class php {
  # Installs PHP and restarts Apache to load the module
  package { ['php5', 'php-apc', 'libapache2-mod-php5', 'php5-dev', 'php5-xdebug', 'php5-mysql', 'php5-gd', 'php5-imagick', 'php5-mcrypt', 'php5-memcache', 'php5-mhash', 'php5-pspell', 'php5-snmp', 'php5-sqlite', 'php5-xmlrpc', 'php5-xsl']:
    ensure  => installed,
    notify  => Service['apache2'],
    require => [Package['mysql-client'], Package['apache2']],
  }
}
