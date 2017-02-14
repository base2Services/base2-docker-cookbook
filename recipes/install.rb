#
# Cookbook Name:: base2-docker
# Recipe:: install
#
# Copyright 2017, base2services
#
# All rights reserved - Do Not Redistribute
#

docker_service "default" do
  action [:create, :start]
end
