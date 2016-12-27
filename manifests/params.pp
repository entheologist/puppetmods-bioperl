# = Class: bioperl::params
#
# This class defines default parameters used by the main module class bioperl.
# Operating Systems differences in names and paths are addressed here.
#
# == Variables:
#
# Refer to bioperl class for the variables defined here.
#
# == Usage:
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes.
#
class bioperl::params {
  $target_dir    = '/usr/local/lib'
  $package_dir    = 'bioperl'
  $user          = 'vagrant'
  $version       = '1.6.1'
}
