# os helpers beyond built-in methods

def rhel_family?
  %w[redhat amazon].include?(os[:family])
end

def debian_family?
  %w[debian ubuntu].include?(os[:family])
end

def amazon_linux?
  os[:name] == 'amazon'
end

def ubuntu?
  %w[ubuntu].include?(os[:family])
end

def rhel6?
  redhat? && os[:release].to_f.between?(6.0, 6.9)
end

def rhel7?
  redhat? && os[:release].to_f.between?(7.0, 7.9)
end

def ubuntu1404?
  ubuntu? && release?('14.04')
end

def ubuntu1604?
  ubuntu? && release?('16.04')
end

def release?(test_version)
  os[:release] == test_version
end

def docker?
  File.exist?('/.dockerenv')
end

def ec2?
  # TODO: Add some improved logic for other OSs and ECS Containers?
  File.directory?('/home/ec2-user')
end

# def ec2?
#   fqdn = node['fqdn']
#   return true if fqdn =~ /^ip-.*\.compute\.internal$/
#
#   case node['platform_family']
#   when 'rhel'
#     ec2_user = '/home/ec2-user'
#     ec2_net_script = '/etc/sysconfig/network-scripts/ec2net-functions'
#     ::File.directory?(ec2_user) || ::File.exist?(ec2_net_script)
#   when 'windows'
#     ::File.directory?('C:/Users/ec2-user')
#   else
#     false
#   end
# end
