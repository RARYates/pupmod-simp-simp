require 'spec_helper'

describe 'simp::snmpd::server' do

  let(:facts) {{
    :operatingsystem => 'RedHat',
    :lsbmajdistrelease => '6',
    :lsbdistrelease => '6.6',
    :passenger_version => '4',
    :selinux_current_mode => 'enforcing',
    :grub_version => '0.9',
    :uid_min => '500',
    :apache_version => '2.2',
    :init_systems => ['rc','sysv','upstart'],
    :interfaces => 'eth0',
    :ipaddress_eth0 => '10.10.10.10',
    :trusted => {
      :certname => 'foo.bar.baz'
    }
  }}

  it { should create_class('simp::snmpd::server') }
  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should contain_class('snmpd::authtrapenable') }
end
