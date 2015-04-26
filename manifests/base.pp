# basic configuration
class imapproxy::base {

  package {'up-imapproxy':
    ensure => present,
  }
  $options = keys($imapproxy::real_options)
  imapproxy::config_options{
    $options:;
  }
  service {'imapproxy':
    ensure => running,
    enable => true,
  }
}
