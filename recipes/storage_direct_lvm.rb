#
# Cookbook Name:: base2-docker
# Recipe:: storage_direct_lvm
#
# Copyright 2017, base2services
#
# All rights reserved - Do Not Redistribute
#

# This uses the devicemapper stroage driver with a seperate LVM thinpool volume
# NOTE: requires an additional EBS volume

execute "Set IP Forwarding" do
  command "sed -i -E \"s/^ *net.ipv4.ip_forward += +.*$/net.ipv4.ip_forward = 1/g\" /etc/sysctl.conf"
  action :run
end

lvm_volume_group "docker" do
  physical_volumes ["/dev/xvdf"]
  thin_pool "thinpool" do
    size "95%VG"
  end
end

template "/etc/lvm/profile/docker-thinpool.profile" do
  source "docker-thinpool.profile.erb"
end

execute "apply_lvm_profile" do
  command "lvchange --metadataprofile docker-thinpool docker/thinpool"
end

yum_package "docker" do
  version node["base2-docker"]["docker"]["version"]
  action :install
end

docker_service "default" do
  storage_opts [
    "dm.thinpooldev=/dev/mapper/docker-thinpool",
    "dm.use_deferred_removal=true",
    "dm.use_deferred_deletion=true"
  ]
  default_ulimit [
    "nofile=10240:14336"
  ]
  action :start
end
