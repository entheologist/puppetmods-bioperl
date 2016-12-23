# puppetmods-bioperl
Puppet module for installing BioPerl. Currently it is only compatible with Ubuntu. 

# Usage

## Default Options
class { 'bioperl': }

## Custom parameters
You can also specify the installation directory, and the version of BioPerl
class { 'bioperl':
   target_dir => '/usr/share/lib',
   version => '1.6.6'
}
