use_inline_resources

def build_listenon(a)
  by_port = {}
  a.each do |l|
    ip, port = l.split(':')
    port = '53' if port.nil?
    by_port[port] = [] if by_port[port].nil?
    by_port[port].push(ip)
  end

  by_port
end

def configure
  resource_names = run_context.root_run_context.resource_collection.keys.select { |k| k.start_with?('bind9dns_') }
  acls = []
  zones = []

  bind9dns_resources = []

  resource_names.each do |n|
    rsrc = run_context.root_run_context.resource_collection.find(n)
    bind9dns_resources.push(rsrc) unless rsrc.nil? || rsrc.action.include?(:delete)
  end

  bind9dns_resources.each do |r|
    acls.push(r) if r.is_a?(Chef::Resource::Bind9dnsAcl)
    zones.push(r) if r.is_a?(Chef::Resource::Bind9dnsZone)
  end

  t = template new_resource.config_file do
    variables(
      ACLs: acls,
      LISTENON: build_listenon(new_resource.listen_on),
      ALLOW_QUERY: new_resource.allow_query,
      RECURSION: new_resource.recursion,
      DNSSEC_ENABLE: new_resource.dnssec_enable,
      DNSSEC_VALIDATION: new_resource.dnssec_validation,
      BINDKEYS_FILE: new_resource.bindkeys_file,
      MANGED_KEYS_DIR: new_resource.managed_keys_directory,
      PID_FILE: new_resource.pid_file,
      SESSION_KEYFILE: new_resource.session_keyfile,
      ZONES: zones
    )
    source 'named.conf.erb'
    action :create
    cookbook new_resource.cookbook
    notifies :check_config, "bind9dns[#{new_resource.name}]", :immediately
  end

  t.updated_by_last_action?
end

action :configure do
  converge_by('Configuring named') do
    @new_resource.updated_by_last_action(configure)
  end
end

action :check_config do
  converge_by('Checking named configuration') do
    @new_resource.updated_by_last_action(false)
    check_config = Mixlib::ShellOut.new("#{new_resource.config_file_check} #{new_resource.config_file}")
    check_config.run_command

    raise "Unable to verify named configuration #{check_config.stdout}" if check_config.error?
  end
end

def load_current_resource
  @current_resource = Chef::Resource::Bind9dns.new(@new_resource.name)

  copy_attributes @new_resource, @current_resource

  @current_resource.exists = false
end
