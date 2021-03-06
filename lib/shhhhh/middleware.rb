module Shhhhh
  class Middleware < Rails::Rack::Logger
    protected

    def call_app(request, env)
      # if the path looks like /assets/some/script.js, don't bother logging
      if env['PATH_INFO'] =~ /\A\/assets\//
        @app.call(env)
      else
        super
      end

      ensure
        ActiveSupport::LogSubscriber.flush_all!
    end
  end
end
