actions :configure, :check_config
#:create, :delete, :update

default_action :configure if defined?(default_action)

attribute :name, name_attribute: true, kind_of: String, required: false
attribute :listen_on, kind_of: Array, required: false, default: ['127.0.0.1-53']
attribute :listen_on_v6, kind_of: Array, required: false, default: ['::1-53']
attribute :allow_query, kind_of: Array, required: false, default: %w(localhost localnets)
attribute :config_file, kind_of: String, required: false, default: node['bind9dns']['config_file']
attribute :config_file_check, kind_of: String, required: false, default: node['bind9dns']['config_file_check']
attribute :recursion, kind_of: [TrueClass, FalseClass], required: false, default: true
attribute :dnssec_enable, kind_of: [TrueClass, FalseClass], required: false, default: false
attribute :dnssec_validation, kind_of: [TrueClass, FalseClass], required: false, default: false
attribute :bindkeys_file, kind_of: String, required: false, default: node['bind9dns']['options']['bindkeys-file']
attribute :managed_keys_directory, kind_of: String, required: false, default: node['bind9dns']['options']['managed-keys-directory']
attribute :pid_file, kind_of: String, required: false, default: node['bind9dns']['options']['pid-file']
attribute :session_keyfile, kind_of: String, required: false, default: node['bind9dns']['options']['session-keyfile']
attribute :cookbook, kind_of: String, required: true, default: 'bind9dns'

attr_accessor :exists # This is a standard ruby accessor, use this to set flags for current state.
