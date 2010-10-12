module FlashCookieSession
  class Railtie < Rails::Railtie
    initializer "flash_cookie_session.initializer" do

      # Manually load the session_store config file
      # even though this shouldn't be necessary
      # otherwise Rails.application.config.session_options[:key] comes up nil :(
      session_store_config = Rails.root.join('config/initializers/session_store.rb')

      if session_store_config.exist?
        require session_store_config
      end

      Rails.application.middleware.insert_before(
        Rails.application.config.session_store,
        "FlashCookieSession::Middleware",
        Rails.application.config.session_options[:key]
      )
    end
  end
end
