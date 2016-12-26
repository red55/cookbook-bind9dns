actions :create, :delete, :update
default_action :create if defined?(default_action)

attribute :name, name_attribute: true, kind_of: String, required: true

attribute :allow_query, kind_of: Array, required: false, default: ['any']
attribute :allow_transfer, kind_of: Array, required: false, default: ['none']
attribute :allow_update, kind_of: Array, required: false, default: ['none']
attribute :file, kind_of: String, required: false, default: nil
attribute :masters, kind_of: Array, required: false, default: []
attribute :notify, kind_of: [TrueClass, FalseClass], required: false, default: false
attribute :forward, kind_of: String, required: false, default: 'only', regex: /^(only|first)$/
attribute :forwarders, kind_of: Array, required: false, default: []
attribute :type, kind_of: String, required: true, regex: /^(master|slave|hint|forward)$/
attribute :zone_statistics, kind_of: [TrueClass, FalseClass], required: false, default: false

attr_accessor :exists # This is a standard ruby accessor, use this to set flags for current state.
