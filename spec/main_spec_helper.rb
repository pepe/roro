require 'capybara/rspec'
require_relative 'db_spec_helper'
require_relative '../app'


Capybara.configure do |config|
  config.app = App::Main.app
end

def app
  App::Main.app
end

include Domain
init_store(:test) unless store