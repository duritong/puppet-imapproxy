class imapproxy::disable inherits imapproxy {
    case $operatingsystem {
        default: { include imapproxy::disable::base }
    }
}
