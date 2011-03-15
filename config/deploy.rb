set :application, "upload_1"
set :user, "root"
set :use_sudo, true
set :scm, :git
set :repository,  "git@github.com:ankuramzn/rails_education.git"
set :deploy_via, :copy


ssh_options[:keys] = ["#{ENV['HOME']}/.ec2/ec2-keypair"]


role :web, "ec2-50-16-175-141.compute-1.amazonaws.com"                          # Your HTTP server, Apache/etc
role :app, "ec2-50-16-175-141.compute-1.amazonaws.com"                          # This may be the same as your `Web` server
role :db,  "ec2-50-16-175-141.compute-1.amazonaws.com", :primary => true # This is where Rails migrations will run

set :rails_env, "production"



set :ec2onrails_config, {

  # Set the server timezone. run "cap -e ec2onrails:server:set_timezone" for
  # details
  :timezone => "Canada/Eastern",

  :services_to_restart => %w(apache2 postfix sysklogd),

  # Set an email address to forward admin mail messages to. If you don't
  # want to receive mail from the server (e.g. monit alert messages) then
  # remove this.
  :admin_mail_forward_address => "ankur.saksena@gmail.com",

  :mysql_root_password => "",

  # Set this if you want SSL to be enabled on the web server. The SSL cert
  # and key files need to exist on the server, The cert file should be in
  # /etc/ssl/certs/default.pem and the key file should be in
  # /etc/ssl/private/default.key (see :server_config_files_root).
  :enable_ssl => false
}
