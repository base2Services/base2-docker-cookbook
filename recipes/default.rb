#
# Cookbook Name:: base2-docker
# Recipe:: default
#
# Copyright 2017, base2services
#
# All rights reserved - Do Not Redistribute
#

include_recipe "base2-docker::install"
include_recipe "base2-docker::storage_direct_lvm"
