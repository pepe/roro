require_relative 'app'

include Domain::Store
init_store
prepare_schema
