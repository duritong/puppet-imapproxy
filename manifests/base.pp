class imapproxy::base {

    package { up-imapproxy:
        ensure => present,
    }

    file{'/etc/imapproxy.conf':
        source => [ "puppet://$server/files/imapproxy/${fqdn}/imapproxy.conf",
                    "puppet://$server/files/imapproxy/imapproxy.conf",
                    "puppet://$server/imapproxy/imapproxy.conf" ],
        require => Package[up-imapproxy],
        notify => Service[imapproxy],
        owner => root, group => 0, mode => 0644;
    }

    service {'imapproxy':
        ensure  => running,
        enable => true,
    }
}
