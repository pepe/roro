require 'main_spec_helper'

RSpec.feature 'Beans API' do
  scenario 'pinging api' do
    visit '/api/ping'
    expect(page.body).to eq('{"ping":"pong"}')
  end

  scenario 'getting all beans' do
    visit '/api/beans'
    expect(page.body).to eq \
      "[{\"id\":1,\"name\":\"1. bean\",\"position\":\"1 1\"},{\"id\":2,\"name\":\"2. bean\",\"position\":\"2 2\"},{\"id\":3,\"name\":\"3. bean\",\"position\":\"3 3\"},{\"id\":4,\"name\":\"4. bean\",\"position\":\"4 4\"}]"
  end

  scenario 'getting one bean' do
    visit '/api/beans/1'
    expect(page.body).to eq \
    "{\"id\":1,\"name\":\"1. bean\",\"position\":\"1 1\"}"
  end
end
