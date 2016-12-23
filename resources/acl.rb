actions :create, :delete, :update

default_action :create if defined?(default_action)

attribute :name, name_attribute: true, kind_of: String, required: true

attribute :nets, kind_of: Array, required: true

attr_accessor :exists # This is a standard ruby accessor, use this to set flags for current state.
