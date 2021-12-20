node_data_file_path = os[:family] == 'windows' ? 'C:\node.json' : '/opt/node.json'
node_data_after_reload = os[:family] == 'windows' ? 'C:\node_after.json' : '/opt/node_after.json'

describe json(node_data_file_path) do
  its(%w(automatic ec2 tags created-by)) { should eq 'test-kitchen' }
  its(%w(automatic ec2 tags example-tag)) { should eq 'example' }
end

describe json(node_data_after_reload) do
  its(%w(automatic ec2 tags created-by)) { should eq 'test-kitchen' }
  its(%w(automatic ec2 tags example-tag)) { should eq 'example' }
end
