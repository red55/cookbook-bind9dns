name 'bind9dns_test'
maintainer 'Leonid Korokh'
maintainer_email 'lkorokh@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures bind9dns_test'
long_description 'Installs/Configures bind9dns_test'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'bind9dns'
depends 'resolver', '~>2.0'