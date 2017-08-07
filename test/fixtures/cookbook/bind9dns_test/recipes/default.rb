#
# Cookbook:: bind9dns_test
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'resolver::default'

begin
  dns = resources('bind9dns[named]')
rescue Chef::Exceptions::ResourceNotFound
  dns = bind9dns
end

bind9dns_zone 'csi-group.local' do
  type 'forward'
  forwarders %w(192.168.104.102 192.168.104.101)
end
