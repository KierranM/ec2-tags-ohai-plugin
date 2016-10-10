require 'json'
require 'serverspec'

file_path = os.windows? ? 'C:\node.json' : '/opt/node.json'

describe file(file_path) do
  it { should exist }
end

node_data = JSON.parse(File.read(file_path))

describe 'created-by' do
  it 'should be test-kitchen' do
    expect(node_data['ec2']['tags']['created-by']).to eq 'test-kitchen'
  end
end

describe 'example-tag' do
  it 'should be example' do
    expect(node_data['ec2']['tags']['example-tag']).to eq 'example'
  end
end
