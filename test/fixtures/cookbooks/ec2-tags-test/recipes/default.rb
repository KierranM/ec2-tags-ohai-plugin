require 'json'

include_recipe 'ec2-tags-ohai-plugin'

file_path = node['platform'] == 'windows' ? 'C:\node.json' : '/opt/node.json'

file file_path do
  content JSON.pretty_generate(node)
  sensitive true
end
