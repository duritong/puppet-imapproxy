# modules/imapproxy/manifests/init.pp - manage imapproxy stuff
# Copyright (C) 2007 admin@immerda.ch
#

# modules_dir { "imapproxy": }

class imapproxy {
    $modulename = "imapproxy"
    $pkgname = "up-imapproxy"
    $gentoocat = "net-mail"
    $cnfname = "imapproxy.conf"
    $cnfpath = "/etc"


    package { $pkgname:
        ensure => present,
        category => $operatingsystem ? {
            gentoo => $gentoocat,
            default => '',
        }
    }

    file{
        "${cnfpath}/${cnfname}":
            source => [
                "puppet://$server/dist/${modulename}/${fqdn}/${cnfname}",
                "puppet://$server/${modulename}/${fqdn}/${cnfname}",
                "puppet://$server/${modulename}/${cnfname}"
            ],
            owner => root,
            group => 0,
            mode => 0444,
            require => Package[$pkgname],
    }


}
