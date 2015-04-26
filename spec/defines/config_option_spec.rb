require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'imapproxy::config_option', :type => 'define' do
  let(:title){'server_hostname'}
  let(:params){
    {
      :value => 'imap.example.com',
    }
  }
  context 'with default params' do
    it { should contain_file_line('imapproxy_server_hostname').with(
      :path    => '/etc/imapproxy.conf',
      :line    => 'server_hostname imap.example.com',
      :match   => '^(#)?server_hostname ',
      :require => 'Package[up-imapproxy]',
      :notify  => 'Service[imapproxy]',
    )}
  end
end

