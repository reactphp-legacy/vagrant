class dependencies {
	package {'git':
		name   => 'git-core',
		ensure => installed,
		before => Class['php_modules']
	}
	package {'libevent':
		name   => 'libevent-dev',
		ensure => installed,
		before => Class['php_modules']
	}
	package {'libev':
		name   => 'libev-dev',
		ensure => installed,
		before => Class['php_modules']
	}
	package {'pkg-config':
		name   => 'pkg-config',
		ensure => installed,
		before => Class['php_modules']
	}
	package {'ZeroMQ':
		name   => 'libzmq-dev',
		ensure => installed,
		before => Class['php_modules']
	}
}
