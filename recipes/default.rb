# bind9dns_acl 'csi-azure' do
#  nets ['10.0.0.0/24']
# end

bind9dns_zone '.' do
  type 'forward'
  forward 'only'
  forwarders %w(192.168.104.101 192.168.104.102)
  # type 'hint'
  # file 'named.ca'
end

bind9dns_zone 'csi-group.local' do
  type 'forward'
  forward 'only'
  forwarders %w(192.168.104.101 192.168.104.102)
end

bind9dns 'named' do
  recursion true
  action :configure
  listen_on ['127.0.0.1:53']
  notifies :restart, 'service[named]', :delayed
end

service 'named' do
  supports [:start, :stop, :restart, :reload, :status]
  action :start
end
