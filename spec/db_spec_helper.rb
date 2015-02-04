RSpec.configure do |config|
  config.before do
    store.repositories[:default].connection.drop_table(:beans) rescue nil
    store.repositories[:default].connection.create_table :beans do
      primary_key :id
      String :name
      String :position
    end

    (1..4).each do |i|
      store.command(:beans).try { create(name: "#{i}. bean", position: "#{i} #{i}") }
    end
  end
end
