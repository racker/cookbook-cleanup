maintainer 'Rackspace'
maintainer_email 'dave.king@rackspace.com'
license 'Apache 2.0'
name 'infongen_cleanup'
description 'Installs/Configures cleanup'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'

source_url 'https://github.com/racker/cookbook-cleanup' if respond_to?(:source_url)
issues_url 'https://github.com/racker/cookbook-cleanup/issues' if respond_to?(:issues_url)

supports 'centos'
supports 'debian'
supports 'ubuntu'
supports 'windows'