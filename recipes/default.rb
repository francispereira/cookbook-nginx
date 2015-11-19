#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


template '/etc/yum.repos.d/nginx.repo' do
  source 'nginx.repo.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

node['nginx']['packages'].each do |nginx_package|
  package nginx_package do
    action :install
    flush_cache [:before => false, :after => false]
  end
end

node['nginx']['default_config_files'].each do |default_conf|
  file default_conf do
    action :delete
    notifies :restart, 'service[nginx]', :delayed
  end
end

directory node['nginx']['ssl_dir'] do
  owner 'root'
  group 'root'
  mode '0700'
  action :create
end

# notifies :restart, 'service[chef-solr]', :delayed
service node['nginx']['service'] do
  action [:enable, :start]
  ignore_failure TrueClass
end
