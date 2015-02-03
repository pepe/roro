ROM.relation(:beans) do
  def main_page
    order(Sequel.desc(:id)).limit(3)
  end
end


