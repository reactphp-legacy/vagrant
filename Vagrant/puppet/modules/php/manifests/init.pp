class php {
  # Installs PHP and restarts Apache to load the module
  package { ['php54', 'php54-apc', 'php54-mod-php', 'php5-dev']:
    ensure  => installed,
    notify  => Service['apache2'],
    require => [File['servergrove.repo'], Package['mysql-client'], Package['apache2']],
  }
}
