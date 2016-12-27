class bioperl (
  $target_dir       = 'UNDEF',
  $user             = 'UNDEF',
  $version          = 'UNDEF'
) {
  validate_string($target_dir)
  validate_string($user)
  validate_string($version)

  ensure_packages(['wget','tar','git','puppet'])

  include bioperl::params

  $slug = 'bioperl'

  $bioperl_target_dir = $target_dir ? {
    'UNDEF' => $::bioperl::params::target_dir,
    default => $target_dir
  }

  $bioperl_version = $version ? {
    'UNDEF' => $::bioperl::params::version,
    default => $version
  }

  $bioperl_user = $user ? {
    'UNDEF' => $::bioperl::params::user,
    default => $user
  }

  $package_name = "BioPerl-${bioperl_version}"

  $archive_name = "${package_name}.tar.gz"

  $install_path = "${bioperl_target_dir}/${package_name}"
  $archive_path = "${bioperl_target_dir}/${archive_name}"

  $package_uri = "https://cpan.metacpan.org/authors/id/C/CJ/CJFIELDS/${archive_name}"

  notify { 'Installing':
    withpath => true,
    name     => "Installing package ${package_name}, to ${install_path}",
  }

  exec { 'bioperl-download':
    command => "sudo /usr/bin/wget --no-check-certificate -O ${archive_path} ${package_uri}",
    require => Package['wget'],
    creates => $archive_path
  }

  exec { 'bioperl-extract':
    command => "sudo /bin/tar zxvf ${archive_name}; sudo rm ${archive_name}",
    cwd => "${bioperl_target_dir}",
    require => Exec['bioperl-download']
  }

  $var_name = 'PERL5LIB'
  $var_base = 'PERL5LIB=${PERL5LIB}'

  $var_string = "${var_base}:${install_path}"
  $export_string = "export ${var_name}"
  $nl = '\n'
  $fmt = '%s\n%s'

  $output_string = "${var_string}${nl}${export_string}"
  $env_tmp_path = "/tmp/${slug}.tmp"
  $env_file_path = "/etc/profile.d/${slug}.sh"

  exec { 'bioperl-path':
    command => "/bin/echo -e '${output_string}' > ${env_tmp_path}; sudo mv -f ${env_tmp_path} ${env_file_path}",
    creates => $env_file_path
  }

}