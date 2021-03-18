log_level :info
log_location STDOUT
ssl_verify_mode :verify_none
node_name "#{ENV['KNUSER']}"
client_key "#{ENV['HOME']}/.chef/knife.pem"
chef_server_url 'https://10.232.8.200/organizations/packer'
cookbook_path [ "#{ENV['KNCKBPATH']}" ]
knife[:editor]="#{ENV['KNEDITOR']}"