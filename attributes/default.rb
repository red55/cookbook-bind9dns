default['bind9dns']['packages'] = %w(bind bind-utils)
default['bind9dns']['config_file'] = '/etc/named.conf'
default['bind9dns']['config_file_check'] = 'named-checkconf'
default['bind9dns']['options']['directory'] = '/var/named'
default['bind9dns']['options']['bindkeys-file'] = '/etc/named.iscdlv.key'
default['bind9dns']['options']['managed-keys-directory'] = '/var/named/dynamic'
default['bind9dns']['options']['pid-file'] = '/run/named/named.pid'
default['bind9dns']['options']['session-keyfile'] = '/run/named/session.key'



