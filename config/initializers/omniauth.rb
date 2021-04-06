require File.expand_path('lib/omniauth/strategies/vendor', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vendor, ENV["OAUTH_ID"], ENV["OAUTH_SECRET"], provider_ignores_state: true
end
