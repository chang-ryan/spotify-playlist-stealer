require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SpotifyTestApp
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  end
end

RSpotify::authenticate("f1b17230739d4674ba42bc49c184fd30", "e0a2d0ab093e40008a6610fd981aa5e1")
