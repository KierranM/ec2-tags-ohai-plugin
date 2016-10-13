require 'json'
require 'serverspec'

describe 'EC2 Tags plugin' do
  let(:file_path) { os['family'] == 'windows' ? 'C:\node.json' : '/opt/node.json' }
  let(:node_data) { JSON.parse(File.read(file_path)) }

  describe file(file_path) do
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
