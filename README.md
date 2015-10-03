# React Vagrant

This project provides a Vagrant configuration for developing with or for [ReactPHP](https://github.com/reactphp). It aims to provide a comprehensive set of tools and extensions for PHP development and could be used for general PHP development.

## Prerequisites

You will need to first ensure you have installed [Vagrant](http://www.vagrantup.com/downloads) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads).

## Install

Simply clone this project into a directory one level below the root of your project. For example, if your project is located at ~/foo this project should be cloned into ~/foo/Vagrant. This project uses submodules so you'll need to use the --recursive option when you clone it or init the submodules afterwards. Cd into the directory for the project (~/foo/Vagrant) and run 'vagrant up'.

The vagrant configuration will mount two directories in the VM. The directory where the Vagrantfile is located (~/foo/Vagrant in our example) will be mounted at /Vagrant in the vm. The root directory of the project (~/foo in the example) will be mounted at /project\_data. If a composer.json file is present in the root directory of the project the final part of running 'vagrant up' will run 'composer install' in that directory.

## VM Configuration

The Vagrant configuration uses the 'precise64' base box available from http://files.vagrantup.com/precise64.box. If you do not have this box installed on your system Vagrant will automatically download it for you the first time you run 'vagrant up'. Vagrant will install the following software, packages and dependencies.

### Dependencies

The following dependencies are installed using apt-get as they are required to install and build other modules:

- git-core
- libevent-dev
- libev-dev
- libzmq-dev
- pkg-config
- build-essential
- python-software-properties
- cURL

### Apache

Apache2 is installed and a single VirtualHost is created that resolves to /Vagrant/web in the VM. This directory contains a single 'index.php' file that outputs phpinfo(). Vagrant is configured to forward all traffic on port 8080 on the host OS to port 80 on the guest VM.

### MySQL

Both mysql-server and mysql-client are installed on the VM.

### PHP

PHP 5.4 is installed using a custom PPA for Ubuntu. The following modules and extensions are installed:

#### PHP Extensions

- apc
- imagick 
- mysql 
- gd 
- mcrypt 
- memcache 
- pspell 
- snmp 
- sqlite 
- xmlrpc 
- xsl 
- curl

#### PECL Modules

- XDebug
- Libevent
- ZeroMQ

#### Other extensions

- Libev (compiled and installed from https://github.com/m4rw3r/php-libev)

### Composer

Composer is installed globally to /usr/local/bin in the VM. Puppet then runs 'composer install' in /project\_data if it finds a composer.json file there.

## Supported Platforms

This Vagrant config has been developed and tested on Ubuntu 12.10. It has also been tested on OSX.

## TODO

- Further clean up puppet configuration
- Review the installed PHP extensions and add or remove ones as needed.
