#
# Cookbook Name:: manju-docker
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

docker_installation 'default' do
  repo 'main'
  action :create
end

docker_image 'ubuntu-base' do
  action :import
  source '/tmp/ubuntu-base.tar'
end

docker_container 'test123' do
  repo 'ubuntu-base'
  action :run
  command "sleep 100"
end
