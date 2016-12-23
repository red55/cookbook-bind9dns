use_inline_resources

action :create do
  unless @current_resource.exists
    converge_by("Creating ACL #{@new_resource.name}") do
      resp = create
      @new_resource.updated_by_last_action(resp)
    end
  end
end

action :delete do
  unless @current_resource.exists
    converge_by("Deleteing ACL #{@new_resource.name}") do
      resp = delete
      @new_resource.updated_by_last_action(resp)
    end
  end
end

action :update do
  unless @current_resource.exists
    converge_by("Update ACL #{@new_resource.name}") do
      resp = update
      @new_resource.updated_by_last_action(resp)
    end
  end
end

def create
  # t.updated_by_last_action?
  true
end

def delete
  # t.updated_by_last_action?
  true
end

def update
  # t.updated_by_last_action?
  true
end

def load_current_resource
  @current_resource = Chef::Resource::Bind9dnsAcl.new(@new_resource.name)

  copy_attributes @new_resource, @current_resource

  @current_resource.exists = false
end
