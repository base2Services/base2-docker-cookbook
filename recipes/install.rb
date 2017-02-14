#
# Cookbook Name:: base2-docker
# Recipe:: install
#
# Copyright 2017, base2services
#
# All rights reserved - Do Not Redistribute
#

# if node["platform"] == "amazon" && node["platform_version"] == "2016.09"
#   yum_package "docker" do
#     version node["base2-docker"]["docker_version"]["amazon"]["2016.09"]
#     action :install
#   end
# else
#   docker_installation_script "default"
# end
#
# service "docker" do
#   action :enable
# end
