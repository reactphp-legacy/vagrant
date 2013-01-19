class dependencies {
	package {'git':
		name => 'git-core',
		ensure => installed
	}
	package {'libevent':
		name => 'libevent-dev',
		ensure => installed
	}
	package {'libev':
		name => 'libev-dev',
		ensure => installed
	}
	package {'ZeroMQ':
		name => 'libzmq-dev',
		ensure => installed
	}
}
