# manage a config_option
define imapproxy::config_option(
  $value,
){
  file_line{
    "imapproxy_${name}":
      line    => "${name} ${value}",
      path    => '/etc/imapproxy.conf',
      match   => "^(#)?${name} ",
      require => Package['up-imapproxy'],
      notify  => Service['imapproxy'],
  }
}
