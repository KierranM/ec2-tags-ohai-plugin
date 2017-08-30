require 'json'

Ohai.plugin(:EC2Tags) do
  provides 'ec2/tags'

  depends 'ec2'

  collect_data do
    begin
      require 'aws-sdk-ec2'

      ec2_client = Aws::EC2::Client.new region: ec2['placement_availability_zone'][0...-1]
      resp = ec2_client.describe_tags(
        filters: [
          {
            name: 'resource-id',
            values: [
              ec2['instance_id']
            ]
          }
        ]
      )

      ec2[:tags] = resp.tags.map { |tag| { tag.key => tag.value } }.inject(Mash.new, :merge)
    rescue Aws::EC2::Errors::ServiceError => e
      Ohai::Log.warn("Error while retrieving tags from AWS: #{e.message}")
    rescue LoadError
      Ohai::Log.warn('AWS SDK Gem is not installed, unable to retrieve tags')
    end
  end
end
