# frozen_string_literal: true

require File.expand_path('../boot', __FILE__)

require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'

Bundler.require(*Rails.groups)

module MlitStationsApi
  class Application < Rails::Application
    config.api_only = true
  end
end
