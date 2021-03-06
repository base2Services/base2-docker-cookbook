#
# Cookbook Name:: base2-docker
# Recipe:: default
#
# Copyright 2017, base2services
#
# All rights reserved - Do Not Redistribute
#

require_relative "spec_helper"

describe "base2-docker::storage_direct_lvm" do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  before do
    stub_command("false").and_return(false)
  end

  it "does not raise an exception" do
    expect { chef_run }.to_not raise_error
  end

end
