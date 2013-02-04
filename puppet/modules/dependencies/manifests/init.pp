# Installs dependencies needed by various PHP modules.
class dependencies {
	package {'git-core':
		name   => 'git-core',
		ensure => installed,
		before => Class['php_modules']
	}
	package {'libevent-dev':
		name   => 'libevent-dev',
		ensure => installed,
		before => Class['php_modules']
	}
	package {'libev-dev':
		name   => 'libev-dev',
		ensure => installed,
		before => Class['php_modules']
	}
	package {'pkg-config':
		name   => 'pkg-config',
		ensure => installed,
		before => Class['php_modules']
	}
	package {'libzmq-dev':
		name   => 'libzmq-dev',
		ensure => installed,
		before => Class['php_modules']
	}
	package {'build-essential':
		name   => 'build-essential',
		ensure => installed,
		before => Class['php_modules']
	}	
}
