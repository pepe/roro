require 'main_spec_helper.rb'

RSpec.feature 'Main page' do
  background do
    (1..4).each do |i|
      store.command(:beans).try { create(name: "#{i}. bean", position: "#{i} #{i}") }
    end
  end

  scenario 'listing three last beans' do
    visit '/'
    expect(page.body).to have_content(/[234]\. bean/, count: 3)
  end
end
