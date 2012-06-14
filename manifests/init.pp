# modules/imapproxy/manifests/init.pp - manage imapproxy stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3
#

class imapproxy (
  $manage_shorewall = false  
) {
  case $::operatingsystem {
    gentoo: { include imapproxy::gentoo }
    default: { include imapproxy::base }
  }

  if $manage_shorewall {
    include shorewall::rules::out::imap
  }
}
