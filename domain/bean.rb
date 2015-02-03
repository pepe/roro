module Domain
  class Bean
    include Anima.new(:id, :name, :position)

    def to_json
      to_h.to_json
    end
  end
end

