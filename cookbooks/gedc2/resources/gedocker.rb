property :arguments, String, default: 'show'
property :container_name, String
property :container_action, String
property :contailer_port, String

require_relative 'manju'


raise "Platform not supported, Currently supports Ubuntu/Debian only.." unless node.platform_family? "debian"

run_cmd=Shell_out.new

action :install do
  puts node['platform_family']
  log 'message' do
    message "My node is #{node['platform_family']}"
    level :debug
  end

  execute 'Add Apt keys' do
    command 'apt-key adv \
               --keyserver hkp://ha.pool.sks-keyservers.net:80 \
               --recv-keys 58118E89F3A912897C070ADBF76221572C52609D'
    action :run
  end

  node.run_state['release_name']=run_cmd.run("lsb_release -sc")

  log 'message' do
    message "Release name #{node.run_state['release_name']}"
    level :warn
  end
  template '/etc/apt/sources.list.d/docker.list' do
    source 'docker_repo.erb'
    owner 'root'
    group 'root'
    mode 00744
  end

  include_recipe "apt::default"

  package 'docker-engine' do
    action :install
  end


end

action :show do
  puts node['platform_family']
  log 'message' do
    message "My node is #{node['platform_family']}"
    level :warn
  end
end

action :docker_run do
  a=run_cmd.run("docker #{container_action} -p #{contailer_port} -d #{container_name} sleep 300")
end
