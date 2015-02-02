require_relative 'db_spec_helper'

include Domain
init_store(:test) unless store
