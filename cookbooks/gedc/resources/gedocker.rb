property :arguments, String, default: 'show'


action :install do
  puts node['platform_family']
end

action :show do
  puts node['platform_family']
end
