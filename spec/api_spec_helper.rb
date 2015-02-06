require 'rack/test'
require_relative 'db_spec_helper'
require_relative '../service'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
  App::Main.app
end

def body
  last_response.body
end

def status
  last_response.status
end

def headers
  last_response.headers
end

include Domain::Store
init_store(:test) unless store
