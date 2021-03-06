# == Class: letsencrypt::setup
#
# setup all necessary directories and groups
#
# === Authors
#
# Author Name Bernd Zeimetz <bernd@bzed.de>
#
# === Copyright
#
# Copyright 2016 Bernd Zeimetz
#
class letsencrypt::setup (
    $base_dir = $::letsencrypt::params::base_dir,
    $csr_dir = $::letsencrypt::params::csr_dir,
    $crt_dir = $::letsencrypt::params::crt_dir,
    $key_dir = $::letsencrypt::params::key_dir
) inherits ::letsencrypt::params {

    if $::letsencrypt::manage_user {
        group { $::letsencrypt::group :
            ensure => present,
        }
    }

    File {
        ensure  => directory,
        owner   => 'root',
        group   => $::letsencrypt::group,
        mode    => '0755',
        require => Group[$::letsencrypt::group],
    }

    file { $base_dir : }
    file { $csr_dir : }
    file { $crt_dir : }
    file { $key_dir :
        mode    => '0750',
    }


}
