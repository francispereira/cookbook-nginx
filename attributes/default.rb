default['nginx']['packages'] = %w(nginx)
default['nginx']['default_config_files'] = %w(/etc/nginx/conf.d/default.conf /etc/nginx/conf.d/example_ssl.conf)
default['nginx']['service'] = 'nginx'
default['nginx']['ssl_dir'] = '/etc/nginx/ssl'
