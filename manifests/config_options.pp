# manage the options
define imapproxy::config_options() {
  include ::imapproxy
  imapproxy::config_option{
    $name:
      value => $imapproxy::real_options[$name],
  }
}
