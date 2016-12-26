node['bind9dns']['packages'].each do |p|
  package p do
    action :install
  end
end
