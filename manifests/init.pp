# modules/imapproxy/manifests/init.pp - manage imapproxy stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3
#

class imapproxy {
    case $operatingsystem {
        gentoo: { include imapproxy::gentoo }
        default: { include imapproxy::base }
    }

    if $use_shorewall {
        include shorewall::rules::out::imap
    }
}
