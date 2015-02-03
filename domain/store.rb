
module Domain
  module Store
    def init_store(env='development')
      ROM.setup(:sql, "sqlite://#{env}.sqlite")

      require_relative 'mappers'
      require_relative 'relations'
      require_relative 'commands'

      ROM.finalize
    end

    def store
      ROM.env
    end
  end
end
