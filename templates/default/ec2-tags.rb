require 'json'

Ohai.plugin(:EC2Tags) do
  provides 'ec2/tags'

  depends 'ec2'

  def awscli_installed?
    shell_out('which aws').exitstatus.zero? || shell_out('where.exe aws').exitstatus.zero?
  end

  def aws_ps_tools_installed?
    shell_out("#{powershell} Get-Command -ErrorAction SilentlyContinue Get-EC2Tag").exitstatus.zero?
  end

  def powershell
    'powershell.exe -ExecutionPolicy Unrestricted'
  end

  def get_cli_tags
    instance_id = ec2['instance_id']

    so = shell_out("aws ec2 describe-tags --filters Name=resource-id,Values=#{instance_id}")
    if so.exitstatus.zero?
      ec2[:tags] = JSON.parse(so.stdout)['Tags'].map {|tag| {tag['Key'] => tag['Value']}}.inject(Mash.new, :merge)
    else
      ohai
    end
  end

  def get_ps_tags
    instance_id = ec2['instance_id']
    so = shell_out(%(#{powershell} "Get-EC2Tag -Filter @{ Name='resource-id'; Values='#{instance_id}'} | ConvertTo-Json"))
    if so.exitstatus.zero?
      ec2[:tags] = JSON.parse(so.stdout).map {|tag| {tag['Key'] => tag['Value']}}.inject(Mash.new, :merge)
    else
      ohai
    end
  end

  collect_data do
    if awscli_installed?
      get_cli_tags
    else
      Ohai::Log.debug('AWS CLI is not installed')
    end
  end

  collect_data :windows do
    if awscli_installed?
      get_cli_tags
    elsif aws_ps_tools_installed?
      get_ps_tags
    else
      Ohai::Log.debug('Neither AWS CLI, or AWS powershell tools are installed')
    end
  end
end
