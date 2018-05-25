require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Fels
  class Application < Rails::Application
    config.load_defaults 5.2
    config.active_job.queue_adapter = :delayed_job
  end
end
