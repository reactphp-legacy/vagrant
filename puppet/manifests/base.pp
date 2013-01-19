stage { setup: before => Stage[main] }

class { 'repository':
  # Forces the repository to be configured before any other task
  stage => setup
}
include dependencies
include apache
include mysql
include php
include webserver
