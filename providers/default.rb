
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