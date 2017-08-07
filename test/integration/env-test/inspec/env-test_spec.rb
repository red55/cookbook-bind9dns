
control 'bind9dns-01 - bind packages are installed' do
  impact 1.0
  title ''

  describe package 'bind' do
    it { should be_installed }
  end
  describe package 'bind-utils' do
    it { should be_installed }
  end
end

control 'bind9dns-10 - service running' do
  impact 1.0
  title ''

  describe service 'named.service' do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

control 'bind9dns-20 - recursion enabled' do
  impact 1.0
  title ''

  describe host('ya.ru') do
    it { should be_resolvable }
  end
end

control 'bind9dns-30 - csi-group.local zone forwarding' do
  impact 1.0
  title ''

  describe host('csi-group.local') do
    it { should be_resolvable }
    its('ipaddress') { should include '192.168.104.102' }
  end
end
