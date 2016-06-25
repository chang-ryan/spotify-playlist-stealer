# config/initializers/omniauth.rb

require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "f1b17230739d4674ba42bc49c184fd30", "e0a2d0ab093e40008a6610fd981aa5e1", scope:
    'user-library-read
    playlist-read-private'
end
