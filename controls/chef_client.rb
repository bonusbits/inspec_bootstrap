inspec_chef = attribute('inspec_chef', default: true, description: 'Run Checks for Chef Client')
chef_version = attribute('chef_version', default: '12.21.4', description: 'Chef Client Version')

knife_path =
  if File.exist?('/opt/chefdk/embedded/bin/knife')
    '/opt/chefdk/embedded/bin/knife'
  else
    '/opt/chef/embedded/bin/knife'
  end

if inspec_chef
  describe 'Chef Client' do
    it "chef client version: #{chef_version}" do
      expect(command("#{knife_path} -v").stdout).to include(chef_version)
    end
  end
end
