class php {
  $modPackage = $::osfamily ? {
    debian  => 'php53-mod-php',
    redhat  => 'php53-mod_php',
    default => undef
  }

  # Installs PHP and restarts Apache to load the module
  package { ['php53', 'php53-apc', $modPackage]:
    ensure  => installed,
    notify  => Service['apache2'],
    require => [File['servergrove.repo'], Package['mysql-client'], Package['apache2']],
  }
}
