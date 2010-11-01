require 'rails'

module FlashCookieSession
  class Railtie < Rails::Railtie
    initializer "flash_cookie_session.initializer" do

      # Manually load the config file even though we shouldn't need to,
      # otherwise Rails.application.config.session_options[:key] comes up nil
      session_store_config = Rails.root.join('config/initializers/session_store.rb')

      if session_store_config.exist?
        require session_store_config
      end

      session_store = Rails.application.config.session_store
      session_key = Rails.application.config.session_options[:key]

      raise 'FlashCookieSession config missing' unless session_store && session_key

      Rails.application.middleware.insert_before(
        session_store,
        "FlashCookieSession::Middleware",
        session_key
      )
    end
  end
end
