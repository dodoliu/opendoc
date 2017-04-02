require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Opendoc
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.i18n.default_locale = 'zh-CN'
    #去除rails自带的error样式
    config.action_view.field_error_proc = Proc.new { |html_tag, instance|  html_tag }

    config.cache_store = :redis_store, {
      host: Rails.application.secrets.redis_server,
      port: Rails.application.secrets.redis_port,
      db: Rails.application.secrets.redis_db_num,
      # password: "mysecret",
      namespace: Rails.application.secrets.redis_namespace
    }

    config.active_job.queue_name_prefix = Rails.env
    config.active_job.queue_adapter = :sidekiq
    
  end


end
