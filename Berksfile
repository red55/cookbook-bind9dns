source 'https://supermarket.chef.io'

def company_cookbook(name, version = '>= 0.0.0', options = {})
  cookbook(name, version, { git: "https://github.com/red55/#{name}.git" }.merge(options))
end

company_cookbook('export-node', '>= 0.0.0', options: [branch: 'master'])

group :integration do
  cookbook 'bind9dns_test', path: 'test/fixtures/cookbook/bind9dns_test'
end
metadata
