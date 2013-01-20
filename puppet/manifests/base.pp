exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>	
include repository
include dependencies
include apache
include mysql
include php
include webserver
