# modules/imapproxy/manifests/init.pp - manage imapproxy stuff
# Copyright (C) 2007 admin@immerda.ch
#

# modules_dir { "imapproxy": }

class imapproxy {
    case $operatingsystem {
        gentoo: { include imapproxy::gentoo }
        default: { include imapproxy::base }
    }
}

class imapproxy::base {

    package { up-imapproxy:
        ensure => present,
    }

    file{
        "/etc/imapproxy.conf":
            source => [
                "puppet://$server/files/imapproxy/${fqdn}/imapproxy.conf",
                "puppet://$server/files/imapproxy/imapproxy.conf",
                "puppet://$server/imapproxy/imapproxy.conf"
            ],
            owner => root,
            group => 0,
            mode => 0444,
            require => Package[up-imapproxy],
            notify => Service[imapproxy],
    }

    service { 
        imapproxy: 
            ensure  => running,
            enable => true,
            hasstatus => true,
            hasrestart => true,
    } 
}

class imapproxy::gentoo inherits imapproxy::base {
    Package[up-imapproxy]{
        category => 'net-mail',
    }
}
