# puppetmods-bioperl
Puppet module for installing BioPerl. Currently it is only compatible with Ubuntu. 

# Usage

## Default Options
By default, the library will be installed in /usr/share/lib, and version 1.6.6 will be installed. To load this module with default options:

    class { 'bioperl': }

## Custom parameters
You can also specify the installation directory, and the version of BioPerl:

    class { 'bioperl':
        target_dir => '/usr/share/lib',
        version => '1.6.6'
    }
