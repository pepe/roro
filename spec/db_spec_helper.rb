RSpec.configure do |config|
  config.before do
    store.repositories[:default].connection.drop_table?(:beans)

    prepare_schema

    (1..4).each do |i|
      store.command(:beans).try do
        create(name: "#{i}. bean", position: "#{i} #{i}")
      end
    end
  end
end
