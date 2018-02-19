Airbrake.configure do |config|
  config.api_key = 'c560d240a4604565532886e262af6309'
  config.host    = 'errbit.hut.shefcompsci.org.uk'
  config.port    = 443
  config.secure  = config.port == 443
end
