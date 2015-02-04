require 'main_spec_helper'

RSpec.feature 'Main page' do
  scenario 'listing three last beans' do
    visit '/'
    expect(page.body).to have_content(/[234]\. bean/, count: 3)
  end
end
