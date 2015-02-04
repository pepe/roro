ROM.relation(:beans) do
  def main_page
    order(Sequel.desc(:id)).limit(3)
  end

  def all
    order(:id)
  end

  def by_id(id)
    where(:id => id)
  end
end


