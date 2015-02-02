require_relative 'app'

include Domain
init_store

# Some lousy exception driven stuff
# FIXME: after migrations
begin
  store.repositories[:default].connection.create_table :beans do
    primary_key :id
    String :name
    String :position
  end
rescue
  if (size = store.read(:beans).to_a.size) < 3
    (3 - size).times do |i|
      store.command(:beans).try { create(name: "#{i}. bean", position: "#{i} #{i}") }
    end
  end
end

