require 'json'

include_recipe 'ec2-tags-ohai-plugin'

file_path = platform?('windows') ? 'C:\node.json' : '/opt/node.json'
after_reload = platform?('windows') ? 'C:\node_after.json' : '/opt/node_after.json'

file file_path do
  content JSON.pretty_generate(node)
  sensitive true
end

ohai 'reload'

file after_reload do
  content lazy { JSON.pretty_generate(node) }
  sensitive true
end

