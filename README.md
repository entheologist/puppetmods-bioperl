# puppetmods-bioperl
Puppet module for installing BioPerl

# Usage

Load module with default options:
# class { 'bioperl': }

You can also specify the install directory, and the version of BioPerl:

# class { 'bioperl':
#   target_dir => '/usr/share/lib',
#   version => '1.6.6'
# }
