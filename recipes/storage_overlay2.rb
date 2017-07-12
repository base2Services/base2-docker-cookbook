#
# Cookbook Name:: base2-docker
# Recipe:: storage_direct_lvm
#
# Copyright 2017, base2services
#
# All rights reserved - Do Not Redistribute
#

# This uses the overlay2 stroage driver

execute "Set IP Forwarding" do
  command "echo 1 > /proc/sys/net/ipv4/ip_forward"
  action :run
end

docker_service "default" do
  default_ulimit [
    "nofile=10240:14336"
  ]
  storage_driver 'overlay2'
  action [:create, :start]
end
