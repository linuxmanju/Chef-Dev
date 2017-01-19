property :arguments, String, default: 'install'
property :image_name, String
property :abc, String
property :repo, String
property :entry_script, String
property :ports, Array
property :drive_map, Array

default_action :install


require_relative 'libs/fork'


unless node.platform_family? 'debian'
  raise 'Platform not supported,'\
   'Currently supports Ubuntu/Debian only..'
end

run_cmd = SpawnCmd.new

action :install do
  execute 'apt_add_key' do
    command 'apt-key adv \
        --keyserver hkp://ha.pool.sks-keyservers.net:80 \
        --recv-keys 58118E89F3A912897C070ADBF76221572C52609D'
    action :run
    not_if 'apt-key list| grep  Docker'
  end

  node.run_state['release_name'] = run_cmd.run('lsb_release -sc')

  template '/etc/apt/sources.list.d/docker.list' do
    source 'docker_repo.erb'
    owner 'root'
    group 'root'
    mode 0o0744
  end

  include_recipe 'apt::default'

  package 'docker-engine' do
    action :install
  end

  service 'docker' do
    action [:enable, :start]
  end
end

action :import do
  source = "/zfsdisk/apm/#{image_name}.tar"
  repo_url = "#{node['repo_url']}/#{node['repo_path']}/#{image_name}.tar"

  log_message.output("Downloading image from #{repo_url}")

  directory '/zfsdisk/apm/' do
    owner 'root'
    group 'root'
    mode 0o0755
    recursive true
    action :create
  end

  remote_file source do
    source repo_url
    owner 'root'
    group 'root'
    not_if "test -e #{source}"
  end

  docker_image image_name do
    action :import
    source source.to_s
  end
end

action :run do
  docker_container image_name do
    action :run
    command entry_script
    port ports
    volumes drive_map
  end
end

action :converge do
  include_recipe 'svops_docker::default'
  action_import
  action_run
end
