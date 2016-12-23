
bind9dns_acl 'csi-azure' do
  nets ['192.168.0/24', '192.168.11.1']
end

bind9dns 'named' do
  action :configure
end
