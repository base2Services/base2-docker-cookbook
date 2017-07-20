#
# Cookbook Name:: base2-docker
# Recipe:: install
#
# Copyright 2017, base2services
#
# All rights reserved - Do Not Redistribute
#

execute "Set IP Forwarding" do
  command "sed -i -E \"s/^ *net.ipv4.ip_forward += +.*$/net.ipv4.ip_forward = 1/g\" /etc/sysctl.conf"
  action :run
end

docker_service "default" do
  action [:create, :start]
end
