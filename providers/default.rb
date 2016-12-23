
use_inline_resources

def aaa
     rr = run_context.root_run_context.resource_collection.keys
      Chef::Log.warn("ACL Resources")
      rr.each do |r|
        Chef::Log.warn(r)
      end

        t = template "/var/#{new_resource.name}.acl" do
    variables(
      name: new_resource.name,
      nets: new_resource.nets
    )
    source 'acl.erb'
    cookbook 'bind9dns'
    action :create
  end
end

action :configure do
end

def load_current_resource
  @current_resource = Chef::Resource::Bind9dns.new(@new_resource.name)

  copy_attributes @new_resource, @current_resource

  @current_resource.exists = false
end