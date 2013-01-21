module FlashCookieSession
  class Middleware
    def initialize(app, session_key = Rails.application.config.session_options[:key])
      @app = app
      @session_key = session_key
    end

    def call(env)
      if env['HTTP_USER_AGENT'] =~ /^(Adobe|Shockwave) Flash/ or env['HTTP_REFERER'] =~ /.swf/
        req = Rack::Request.new(env)
        the_session_key = [ @session_key, req.params[@session_key] ].join('=').freeze if req.params[@session_key]

        if req.params['remember_token'] && req.params['remember_token'] != 'null'
          the_remember_token = [ 'remember_token', req.params['remember_token'] ].join('=').freeze
        else
          the_remember_token = nil
        end

        cookie_with_remember_token_and_session_key = [ the_remember_token, the_session_key ].compact.join('\;').freeze

        env['HTTP_COOKIE'] = cookie_with_remember_token_and_session_key
        env['HTTP_ACCEPT'] = "#{req.params['_http_accept']}".freeze if req.params['_http_accept']
      end

      @app.call(env)
    end
  end
end