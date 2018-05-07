#####
#
# These are required to make rvm work properly within crontab
#
if ENV['MY_RUBY_HOME'] && ENV['MY_RUBY_HOME'].include?('rvm')
  env "PATH",         ENV["PATH"]
  env "GEM_HOME",     ENV["GEM_HOME"]
  env "MY_RUBY_HOME", ENV["MY_RUBY_HOME"]
  env "GEM_PATH",     ENV["_ORIGINAL_GEM_PATH"] || ENV["BUNDLE_ORIG_GEM_PATH"] || ENV["BUNDLER_ORIG_GEM_PATH"]
end
#
#####

require 'rake'
env :MAILTO, 'systems@epigenesys.org.uk'
set :output, 'log/whenever.log'
set :environment, 'development'

every :day, at: '1:42pm' do
  rake 'send_weekly_email', :environment => 'development'
end

every :reboot, roles: [ :db ] do
  runner "require 'delayed/command'; Delayed::Command.new(['-p #{@delayed_job_args_p}', '-n #{@delayed_job_args_n}', 'start']).daemonize"
end
