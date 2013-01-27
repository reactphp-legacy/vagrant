class php_modules {
	php::module { "apc":
		module_prefix => "php-"
	}
	php::module { "imagick": }
	php::module { "mysql": }
	php::module { "gd": }
	php::module { "mcrypt": }
	php::module { "memcache": }
	php::module { "pspell": }
	php::module { "snmp": }
	php::module { "sqlite": }
	php::module { "xmlrpc": }
	php::module { "xsl": }
	php::pecl::module { "xdebug": }
	php::pecl::module { "libevent": 
		use_package     => "no",
		preferred_state => "beta",
		notify          => Service['apache2'],
		require         => [Package['apache2'], File['/etc/php5/conf.d/libevent.ini']]
	}
	php::pear::config { auto_discover:
		value => 1
	}
	php::pecl::module { 'pear.zero.mq/zmq-beta':
		use_package     => "no",
		preferred_state => "beta",
		notify          => Service['apache2'],
		require         => [Package['apache2'], File['/etc/php5/conf.d/zmq.ini']]
	}
	file {'/etc/php5/conf.d/libevent.ini':
		path    => '/etc/php5/conf.d/libevent.ini',
		content => 'extension=libevent.so'
	}
	file {'/etc/php5/conf.d/zmq.ini':
		path    => '/etc/php5/conf.d/zmq.ini',
		content => 'extension=zmq.so'
	}
    exec { 'git clone --recursive https://github.com/m4rw3r/php-libev && cd php-libev && phpize && ./configure && make && make install':
		cwd     => '/tmp',
		require => [Package['git-core'], Package['php-devel'], Package['libev-dev']],
		alias   => 'git-libev'
	}
	file {'/etc/php5/conf.d/libev.ini':
		path    => '/etc/php5/conf.d/libev.ini',
		content => 'extension=libev.so',
		require => [Exec['git-libev'], Package['apache2']],
		notify  => Service['apache2']
	}
}
