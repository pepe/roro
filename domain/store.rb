module Domain
  module Store
    # This is messy ROM bag of things
    def init_store(env='development')
      ROM.setup(:sql, "sqlite://#{env}.sqlite")

      ROM.relation(:beans) do
        def main_page
          order(Sequel.desc(:id)).limit(3)
        end
      end

      ROM.mappers do
        define(:beans) do
          model Domain::Bean
        end
      end

      ROM.commands(:beans) do
        define(:create) do
          result :one
        end

        define(:update) do
          result :one
        end

        define(:delete) do
          result :one
        end
      end

      ROM.finalize
    end

    def store
      ROM.env
    end
  end
end
