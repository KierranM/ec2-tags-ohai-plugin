require 'json'
require 'spec_helper'

describe 'EC2 Tags plugin' do
  node_data_file_path = os[:family] == 'windows' ? 'C:\node.json' : '/opt/node.json'
  let(:node_data) { JSON.parse(File.read(node_data_file_path)) }

  describe file(node_data_file_path) do
    it { should exist }
  end

  describe 'created-by' do
    it 'should be test-kitchen' do
      expect(node_data['automatic']['ec2']['tags']['created-by']).to eq 'test-kitchen'
    end
  end

  describe 'example-tag' do
    it 'should be example' do
      expect(node_data['automatic']['ec2']['tags']['example-tag']).to eq 'example'
    end
  end
end
