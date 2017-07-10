#
# Cookbook Name:: base2-docker
# Recipe:: install
#
# Copyright 2017, base2services
#
# All rights reserved - Do Not Redistribute
#

execute "ipv4_forward" do
  command <<-EOF
    sed -i -E "s/^ *net.ipv4.ip_forward += +.*$/net.ipv4.ip_forward = 1/g" /etc/sysctl.conf
    sysctl -p
  EOF
end

docker_service "default" do
  action [:create, :start]
end
