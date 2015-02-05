module Domain
  # Public: domain model of the bean
  class Bean
    include Anima.new(:id, :name, :position)

    # Public: Returns bean as json string
    # Returns: String
    def to_json(*)
      to_h.to_json
    end
  end
end
