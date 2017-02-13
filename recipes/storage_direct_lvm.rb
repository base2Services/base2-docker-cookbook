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

lvm_volume_group "docker" do
  physical_volumes ["/dev/xvdf1"]
  thin_pool "thinpool" do
    size "95%VG"
    mount_point "/docker"
  end
end

template "/etc/lvm/profile/docker-thinpool.profile" do
  source "docker-thinpool.profile.erb"
end

execute "apply_lvm_profile" do
  command "lvchange --metadataprofile docker-thinpool docker/thinpool"
end

docker_service "default" do
  storage_opts [
    "dm.thinpooldev=/dev/mapper/docker-thinpool",
    "dm.use_deferred_removal=true",
    "dm.use_deferred_deletion=true"
  ]
  action :create
end
