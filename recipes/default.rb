#
# Cookbook Name:: ah-wordpress
# Recipe:: default
#
# Copyright 2014, Hello Future Ltd
#
# All rights reserved - Do Not Redistribute
#

node['ah-wordpress']['s3']['files'].each do |src, dest|
  s3_file dest do
    remote_path src
    bucket node['ah-wordpress']['s3']['bucket']
    aws_access_key_id node['ah-wordpress']['s3']['read_access_key']
    aws_secret_access_key node['ah-wordpress']['s3']['read_secret_key']
    mode "0644"
    action :create
  end
end