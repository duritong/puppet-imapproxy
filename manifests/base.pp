# basic configuration
class imapproxy::base {

  package {'up-imapproxy':
    ensure => present,
  } -> file{'/etc/imapproxy.conf':
    source => [ "puppet:///modules/site_imapproxy/${::fqdn}/imapproxy.conf",
                'puppet:///modules/site_imapproxy/imapproxy.conf',
                'puppet:///modules/imapproxy/imapproxy.conf' ],
    owner  => root,
    group  => 0,
    mode   => '0644';
  } ~> service {'imapproxy':
    ensure => running,
    enable => true,
  }
}
