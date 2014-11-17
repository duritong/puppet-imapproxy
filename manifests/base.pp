# basic configuration
class imapproxy::base {

  package {'up-imapproxy':
    ensure => present,
  } -> exec{'fix_imapproxy_init_script':
    command => ' sed -i \'s@killproc @killproc -p /var/run/imapproxy.pid @\' /etc/init.d/imapproxy',
    onlyif  => 'grep -q \'killproc /\' /etc/init.d/imapproxy',
  } -> file{'/etc/imapproxy.conf':
    source => [ "puppet:///modules/site_imapproxy/${::fqdn}/imapproxy.conf",
                'puppet:///modules/site_imapproxy/imapproxy.conf',
                'puppet:///modules/imapproxy/imapproxy.conf' ],
    owner => root,
    group => 0,
    mode  => '0644';
  } ~> service {'imapproxy':
    ensure => running,
    enable => true,
  }
}
