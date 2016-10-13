# ec2-tags-ohai-plugin

## Installation
In order to use this plugin you will need ensure that the following are in your
runlist:
- `recipe[aws]`
- `recipe[ec2-tags-ohai-plugin]`

The `aws` recipe is required as it installs the `aws-sdk-core` gem into the chef
ruby.

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
