Exec { path => '/usr/bin:/bin:/usr/sbin:/sbin' }
exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>	

include repository
include dependencies
include apache
include mysql
include php
include php::devel
include php::pear
include webserver
file {'/etc/php5/conf.d/libevent.ini':
	path    => '/etc/php5/conf.d/libevent.ini',
	content => 'extension=libevent.so',
}
file {'/etc/php5/conf.d/zmq.ini':
	path    => '/etc/php5/conf.d/zmq.ini',
	content => 'extension=zmq.so',
}

php::module { "apc":
	module_prefix => "php-"
}
php::module { "imagick": }
php::module { "mysql": }
php::module { "gd": }
php::module { "mcrypt": }
php::module { "memcache": }
php::module { "mhash": }
php::module { "pspell": }
php::module { "snmp": }
php::module { "sqlite": }
php::module { "xmlrpc": }
php::module { "xsl": }
php::pear::config { auto_discover:
	value => 1
}
php::pecl::module { "xdebug": }
php::pecl::module { "libevent": 
	use_package => "no",
	preferred_state => "beta",
	notify  => Service['apache2'],
	require => [Package['apache2'], File['/etc/php5/conf.d/libevent.ini']]
}
php::pecl::module { 'pear.zero.mq/zmq-beta':
	use_package     => "no",
	preferred_state => "beta",
	notify  => Service['apache2'],
	require => [Package['apache2'], File['/etc/php5/conf.d/zmq.ini']]
}
