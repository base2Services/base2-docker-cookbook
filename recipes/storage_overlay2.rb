#
# Cookbook Name:: base2-docker
# Recipe:: storage_direct_lvm
#
# Copyright 2017, base2services
#
# All rights reserved - Do Not Redistribute
#

# This uses the overlay2 stroage driver

docker_service "default" do
  default_ulimit [
    "nofile=10240:14336"
  ]
  storage_driver 'overlay2'
  action [:create, :start]
end
