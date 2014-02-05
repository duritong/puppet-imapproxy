# a monit snippet for imapproxy
class imapproxy::monit {
  $service_cmd = $::operatingsystem ? {
    debian  => '/usr/sbin/service',
    default => '/sbin/service'
  }
  monit::check::process{'imapproxy':
    pidfile     => '/var/run/imapproxy.pid',
    start       => "${service_cmd} imapproxy start",
    stop        => "${service_cmd} imapproxy stop",
    customlines => [ 'if 5 restarts within 5 cycles then timeout' ],
    require     => Service['imapproxy'],
  }
}
