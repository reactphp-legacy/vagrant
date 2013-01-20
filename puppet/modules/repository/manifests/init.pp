class repository {
	exec {"/usr/bin/add-apt-repository ppa:ondrej/php5":
		alias => "php54_repository",
		require => Package["python-software-properties"]
	}
	package {"python-software-properties":
		ensure => installed
	}
}
