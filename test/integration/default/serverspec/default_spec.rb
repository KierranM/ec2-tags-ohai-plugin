require 'json'
require 'spec_helper'

describe 'EC2 Tags plugin' do
  node_data_file_path = os[:family] == 'windows' ? 'C:\node.json' : '/opt/node.json'
  node_data_after_reload = os[:family] == 'windows' ? 'C:\node_after.json' : '/opt/node_after.json'
  let(:node_data) { JSON.parse(File.read(node_data_file_path)) }
  let(:after_data) { JSON.parse(File.read(node_data_after_reload)) }

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

  describe file(node_data_after_reload) do
    it { should exist }
  end

  describe 'created-by' do
    it 'should be test-kitchen' do
      expect(after_data['automatic']['ec2']['tags']['created-by']).to eq 'test-kitchen'
    end
  end

  describe 'example-tag' do
    it 'should be example' do
      expect(after_data['automatic']['ec2']['tags']['example-tag']).to eq 'example'
    end
  end
end
