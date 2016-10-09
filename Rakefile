require 'erb'
require 'kitchen/rake_tasks'
Kitchen::RakeTasks.new

file 'test-kitchen.pem' => 'test-kitchen.pem.erb' do |task|
  ssh_key_data = ERB.new(File.read(task.source)).result
  File.open(task.name, 'w') { |file| file.write(ssh_key_data) }
  chmod(0700, task.name)
end

task :default => ['test-kitchen.pem', 'kitchen:all']
