class imapproxy::disable::base inherits imapproxy::base {
  Package['up-imapproxy']{
    ensure => absent,
  }

  File['/etc/imapproxy.conf']{
    ensure => absent,
  }

  Service['imapproxy']{
    ensure => stopped,
    enable => false,
  }
}
