require 'shhhhh/middleware'

module Shhhhh
  class AnEngine < Rails::Engine
    initializer 'shhhhh.middleware', after: 'ActionDispatch::RequestId' do |app|
      app.middleware.swap Rails::Rack::Logger, Shhhhh::Middleware
    end
  end
end
