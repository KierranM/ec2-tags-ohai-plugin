# # encoding: utf-8

# Inspec test for recipe ec2-tags-ohai-plugin::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

require 'json'

file_path = os.windows? ? 'C:\node.json' : '/opt/node.json'

describe file(file_path) do
  it { should exist }
end

ndoe_data = JSON.parse(File.read(file_path))

describe 'created-by' do
  it 'should be test-kitchen' do
    expect(node['ec2']['tags']['created-by']).to eq 'test-kitchen'
  end
end

describe 'example-tag' do
  it 'should be example' do
    expect(node['ec2']['tags']['example-tag']).to eq 'example'
  end
end
