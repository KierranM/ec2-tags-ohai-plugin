name 'ec2-tags-ohai-plugin'
maintainer 'Kierran McPherson'
maintainer_email 'kierranm@gmail.com'
license 'apachev2'
description 'Ohai plugin for getting EC2 Tags'
long_description 'Ohai plugin for getting EC2 Tags'
version '0.2.4'
issues_url 'https://github.com/KierranM/ec2-tags-ohai-plugin/issues' if respond_to?(:issues_url)
source_url 'https://github.com/KierranM/ec2-tags-ohai-plugin' if respond_to?(:source_url)

supports 'rhel'
supports 'ubuntu'
supports 'centos'
supports 'fedora'
supports 'amazon'
supports 'windows'

depends 'ohai', '>= 4.0.0'
