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
  command "sed -i -E \"s/^ *net.ipv4.ip_forward += +.*$/net.ipv4.ip_forward = 1/g\" /etc/sysctl.conf"
  action :run
end

docker_service "default" do
  default_ulimit [
    "nofile=10240:14336"
  ]
  storage_driver 'overlay2'
  action [:create, :start]
end
