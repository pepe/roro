module Domain
  # Public: Utility module with ROM bootstrap
  module Store
    def init_store(env = 'development')
      ROM.setup(:sql, "sqlite://#{env}.sqlite")

      require_relative 'mappers'
      require_relative 'relations'
      require_relative 'commands'

      ROM.finalize

      # Some lousy exception driven stuff
      # FIXME: after migrations
    end

    def prepare_schema
      store.repositories[:default].connection.create_table? :beans do
        primary_key :id
        String :name
        String :position
      end
    end

    # Public: Get ROM store
    # Returns: ROM::Env
    def store
      ROM.env
    end
  end
end
