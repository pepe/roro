ROM.relation(:beans) do
  # Public: Beans for the main page
  # Returns: ROM::Relation
  def main_page
    order(Sequel.desc(:id)).limit(3)
  end

  # Public: All beans
  # Returns: ROM::Relation
  def all
    order(:id)
  end

  # Public: One bean by id
  # Returns: ROM::Relation
  def by_id(id)
    where(id: id)
  end
end
