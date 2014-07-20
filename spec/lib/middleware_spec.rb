require 'rubygems'

require 'rails'
require 'rails/all'

require 'shhhhh'

class HomeController < ActionController::Base
  def index
    render :text => 'Hi there!'
  end
end

def request(uri)
  Rack::MockRequest.env_for(uri)
end

RSpec.describe Shhhhh::Middleware do
  before do
    @output = StringIO.new
    @app = Class.new(Rails::Application)
    @app.configure do

      config.active_support.deprecation = :notify
      config.secret_token = '1'*32
      config.eager_load = false

      routes {
        root :to => 'home#index'
        get 'assets/picture' => 'home#index'
      }
    end

    @app.initialize!
    Rails.logger = Logger.new(@output)
    Rails.logger.formatter = lambda { |s, d, p, m| "#{m}\n" }
    @app
  end

  it do
    @app.call request('/assets/picture')

    expect(@output.string).to eq ''
  end

  it do
    @app.call request('/')

    expect(@output.string).to include 'Started GET'
  end
end
