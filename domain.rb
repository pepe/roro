require 'rom'
require 'anima'
require 'json'

module Domain
  class Bean
    include Anima.new(:id, :name, :position)

    def to_json
      to_h.to_json
    end
  end

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
        model Bean
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

