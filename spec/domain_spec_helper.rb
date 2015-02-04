require_relative 'db_spec_helper'
require_relative '../domain'

include Domain::Store
init_store(:test) unless store
