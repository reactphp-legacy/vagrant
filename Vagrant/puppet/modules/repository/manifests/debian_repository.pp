class debian_repository {
  $sourceName = $::operatingsystem ? {
    ubuntu  => 'precise',
    debian  => 'squeeze',
    default => undef
  }

  $debianName = $::operatingsystem ? {
    ubuntu  => "servergrove-ubuntu-${sourceName}",
    debian  => "servergrove-debian-${sourceName}",
    default => undef
  }

  exec { 'source-update':
    command => 'apt-get update',
    path    => ['/bin', '/usr/bin'],
  }

  # We need cURL installed to import the key
  package { 'curl':
    ensure  => installed,
    require => Exec['source-update']
  }

  # Install the GPG key
  exec { 'import-key':
    path    => '/bin:/usr/bin',
    command => "curl http://repos.servergrove.com/${debianName}/${debianName}.gpg.key | apt-key add -",
    unless  => "apt-key list | grep ${debianName}",
    require => Package['curl'],
  }

  # Creates the source file for the ServerGrove repository
  file { 'servergrove.repo':
    path    => '/etc/apt/sources.list.d/servergrove.list',
    ensure  => present,
    content => "deb http://repos.servergrove.com/${debianName} ${sourceName} main",
    require => Exec['import-key'],
  }

  # Refreshes the list of packages
  exec { 'apt-get-update':
    command => 'apt-get update',
    path    => ['/bin', '/usr/bin'],
    require => File['servergrove.repo'],
  }
}
