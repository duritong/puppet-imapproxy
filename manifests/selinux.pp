# manifests/selinux.pp

class imapproxy::selinux {
    case $operatingsystem {
        gentoo: { include imapproxy::selinux::gentoo }
    }
}

class imapproxy::selinux::gentoo {
    selinux::module {"squid_immerda":}
}
