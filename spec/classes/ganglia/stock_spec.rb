require 'spec_helper'

describe 'simp::ganglia::stock' do
  base_facts = {
    "RHEL 6" => {
      :fqdn => 'spec.test',
      :grub_version => '0.97',
      :hardwaremodel => 'x86_64',
      :interfaces => 'lo',
      :ipaddress_lo => '127.0.0.1',
      :lsbmajdistrelease => '6',
      :lsbdistrelease => '6.6',
      :operatingsystem => 'RedHat',
      :operatingsystemmajrelease => '6',
      :processorcount => 4,
      :uid_min => '500',
      :apache_version => '2.2',
      :init_systems => ['rc','sysv','upstart'],
      :selinux_current_mode => 'enforcing',
      :trusted => {
        :certname => 'foo.bar.baz'
      },

    },

    "RHEL 7" => {
      :fqdn => 'spec.test',
      :grub_version => '2.02~beta2',
      :hardwaremodel => 'x86_64',
      :interfaces => 'lo',
      :ipaddress_lo => '127.0.0.1',
      :lsbmajdistrelease => '7',
      :lsbdistrelease => '7.1',
      :operatingsystem => 'RedHat',
      :operatingsystemmajrelease => '7',
      :processorcount => 4,
      :uid_min => '1000',
      :apache_version => '2.2',
      :init_systems => ['rc','sysv','upstart'],
      :selinux_current_mode => 'enforcing',
      :trusted => {
        :certname => 'foo.bar.baz'
      },
    }
  }


  shared_examples_for "a fact set ganglia" do
    it { should create_class('simp::ganglia::monitor') }
    it { should create_class('simp::ganglia::meta') }
    it { should create_class('simp::ganglia::web') }
  end

  describe "RHEL 6" do
    it_behaves_like "a fact set ganglia"
    let(:facts) {base_facts['RHEL 6']}
  end

  describe "RHEL 7" do
    it_behaves_like "a fact set ganglia"
    let(:facts) {base_facts['RHEL 7']}
  end
end
