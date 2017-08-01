use_inline_resources

action :create do
  unless @current_resource.exists
    converge_by("Creating Zone #{@new_resource.name}") do
      @new_resource.updated_by_last_action(create)
    end
  end
end

action :delete do
  unless @current_resource.exists
    converge_by("Deleteing Zone #{@new_resource.name}") do
      @new_resource.updated_by_last_action(delete)
    end
  end
end

action :update do
  unless @current_resource.exists
    converge_by("Updating Zone #{@new_resource.name}") do
      @new_resource.updated_by_last_action(update)
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
  @current_resource = Chef::Resource::Bind9dnsZone.new(@new_resource.name)

  copy_attributes @new_resource, @current_resource

  @current_resource.exists = false
end
