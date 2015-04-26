# modules/imapproxy/manifests/init.pp - manage imapproxy stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3
#
# install and manage imapproxy
class imapproxy (
  $merged_options   = hiera_hash('imapproxy::options',{}),
  $manage_shorewall = false,
  $manage_monit     = false,
) {

  $default_options = {
    'server_hostname'     => "imap.${::domain}",
    'listen_address'      => '127.0.0.1',
    'enable_select_cache' => 'yes',
    'force_tls'           => 'yes',
    'chroot_directory'    => '/var/empty',
    'tls_ca_path'         => '/etc/ssl/certs/',
  }
  $real_options = merge($default_options,$merged_options)

  case $::operatingsystem {
    gentoo: { include imapproxy::gentoo }
    default: { include imapproxy::base }
  }

  if $manage_shorewall {
    include shorewall::rules::out::imap
  }
  if $manage_monit {
    include imapproxy::monit
  }
}
