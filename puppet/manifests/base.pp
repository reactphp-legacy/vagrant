# Set paths to use in exec commands
Exec { path => '/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin' }
exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>	
# composer installation to be run after php modules.
class { 'composer':
	command_name => 'composer',
	target_dir   => '/usr/local/bin',
	auto_update  => true,
	require      => Class['php_modules']
}
# Install composer dependencies only if a composer.json file is present.
exec { 'composer install':
	cwd     => '/project_data',
	require => Class['composer'],
	onlyif  => 'test -f /project_data/composer.json'
}

# Modules to include.
include repository
include dependencies
include apache
include mysql
include php
include php::devel
include php::pear
include php_modules
include webserver
