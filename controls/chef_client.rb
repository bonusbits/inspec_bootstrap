inspec_chef = attribute('inspec_chef', default: true, description: 'Run Checks for Chef Client')
chef_version = attribute('chef_version', default: '12.18.31', description: 'Chef Client Version')

if inspec_chef
  describe 'Chef Client' do
    it "chef client version: #{chef_version}" do
      expect(command('/opt/chef/embedded/bin/knife -v').stdout).to include(chef_version)
    end
  end
end
