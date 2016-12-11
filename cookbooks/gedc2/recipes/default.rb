#
# Cookbook Name:: gedc2
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

gedc2_gedocker "abcd" do
  action :install
end

gedc2_gedocker "kkk" do
  action :show
end

gedc2_gedocker "lll" do
  action :docker_run
  container_name "ubuntu"
  container_action "run"
  #contailer_port "8080:9090"
end
