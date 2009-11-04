config.to_prepare do
  require 'openid'
  require 'openid/consumer'
  require 'openid/store/filesystem'
  require 'rack/openid'


  config.middleware.use ::Rack::OpenID, OpenID::Store::Filesystem.new("#{RAILS_ROOT}/tmp/openid")
end
