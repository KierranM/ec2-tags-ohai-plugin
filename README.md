# ec2-tags-ohai-plugin

[![travis build](https://img.shields.io/travis/KierranM/ec2-tags-ohai-plugin.svg)](https://travis-ci.org/KierranM/ec2-tags-ohai-plugin) [![supermarket]( 	https://img.shields.io/cookbook/v/ec2-tags-ohai-plugin.svg)](https://supermarket.chef.io/cookbooks/ec2-tags-ohai-plugin)

## Installation
In order to use this plugin you will need ensure that the following are in your
runlist:
- `recipe[ec2-tags-ohai-plugin]`

The recipe will install the required `aws-sdk` gem and the `ec2-tags` plugin at
compile time, so it is recommended that this is the first recipe in your runlist
so that the node data it creates can be consumed during the rest of the compilation.

## Usage
Once the plugin has been installed by the `ec2-tags-ohai-plugin` recipe,
the instance tags will be available under `node['ec2']['tags']` as a hash with
the tag key being the hash key, i.e
```ruby
puts node['ec2']['tags']
# {
#   'Name' => 'instance_name',
#   'my_custom_tag' => 'value'
# }
```
