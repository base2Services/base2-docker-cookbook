#
# Cookbook Name:: base2-docker
# Recipe:: install
#
# Copyright 2017, base2services
#
# All rights reserved - Do Not Redistribute
#

execute "Set IP Forwarding" do
  command "echo 1 > /proc/sys/net/ipv4/ip_forward"
  action :run
end

docker_service "default" do
  action [:create, :start]
end
