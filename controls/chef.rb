chef_installed = File.directory?('/opt/chef') || File.directory?('/opt/chefdk')

inspec_chef = attribute('inspec_chef_client', value: chef_installed, description: 'Run Checks for Chef Client')
chef_client_version = attribute('chef_client_version', value: '15.2.20', description: 'Chef Client Version')
chef_dk_version = attribute('chef_dk_version', value: '4.3.13', description: 'ChefDK Version')

debug = attribute('debug', value: false, description: 'Enable Debugging').to_s.eql?('true') ? true : false
if debug
  puts "ATTR: Inspec Chef Client        (#{inspec_chef})"
  puts "ATTR: Chef Client Version       (#{chef_client_version})"
end

control 'chef_client' do
  impact 1.0
  title ''
  only_if { inspec_chef }

  knife_path =
    if File.exist?('/opt/chefdk/embedded/bin/knife')
      '/opt/chefdk/embedded/bin/knife'
    else
      '/opt/chef/embedded/bin/knife'
    end

  describe command("#{knife_path} -v") do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should include(chef_client_version) }
  end
end

control 'chefdk' do
  impact 1.0
  title ''
  only_if { inspec_chef && File.directory?('/opt/chefdk')}

  describe command('/opt/chefdk/embedded/bin/chef -v') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should include("ChefDK version: #{chef_dk_version}") }
  end
end
