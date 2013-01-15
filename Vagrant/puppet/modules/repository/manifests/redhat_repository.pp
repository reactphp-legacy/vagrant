class redhat_repository {
  # We need cURL installed to import the key
  package { 'curl': ensure => installed }

  # Install the GPG key
  exec { 'import-key':
    path    => '/bin:/usr/bin',
    command => 'curl http://repos.servergrove.com/servergrove-rhel-6/RPM-GPG-KEY-servergrove-rhel-6 -o /etc/pki/rpm-gpg/RPM-GPG-KEY-servergrove-rhel-6',
    unless  => 'ls /etc/pki/rpm-gpg/RPM-GPG-KEY-servergrove-rhel-6',
    require => Package['curl'],
  }

  exec { "epel.repo":
    command => 'rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-7.noarch.rpm',
    path    => ['/bin', '/usr/bin'],
    unless  => 'rpm -qa | grep epel',
  }

  yumrepo { 'servergrove':
    baseurl  => 'http://repos.servergrove.com/servergrove-rhel-6/$basearch',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-servergrove-rhel-6',
    require  => Exec['import-key']
  }

  # Creates the source file for the ServerGrove repository
  file { 'servergrove.repo':
    path    => '/etc/yum.repos.d/servergrove.repo',
    require => Yumrepo['servergrove']
  }
}
