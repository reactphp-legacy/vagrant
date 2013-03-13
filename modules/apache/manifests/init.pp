class apache {
	# Ensures Apache2 is installed
	package { 'apache2':
		name   => 'apache2-mpm-prefork',
		ensure => installed,
	}

	# Ensures the Apache service is running
	service { 'apache2':
		name    => 'apache2',
		ensure  => running,
		require => Package['apache2'],
	}
}
