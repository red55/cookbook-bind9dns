# bind9dns_acl 'csi-azure' do
#  nets ['10.0.0.0/24']
# end

bind9dns_zone '.' do
  type 'hint'
  file 'named.ca'
end

bind9dns 'named' do
  recursion true
  action [:configure]
  listen_on ['any-53']
  listen_on_v6 ['none']
  allow_query ['0.0.0.0/0']
  notifies :reload, 'service[named]', :delayed
end

service 'named' do
  supports [:start, :stop, :restart, :reload, :status]
  action :start
end
