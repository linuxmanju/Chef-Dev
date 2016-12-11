property :arguments, String, default: 'show'
require_relative 'manju'

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


  template '/etc/apt/sources.list.d/docker.list' do
    source 'docker_repo.erb'
    owner 'root'
    group 'root'
    mode 00744
  end

end

action :show do
  puts node['platform_family']
  log 'message' do
    message "My node is #{node['platform_family']}"
    level :debug
  end
end
