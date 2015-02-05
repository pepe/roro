require 'api_spec_helper'

RSpec.describe 'Beans API' do
  it 'pongs' do
    get '/api/ping'
    expect(body).to eq('{"ping":"pong"}')
  end

  it 'lists all the beans' do
    get '/api/beans'
    expect(body).to eq \
      "[{\"id\":1,\"name\":\"1. bean\",\"position\":\"1 1\"}," \
      "{\"id\":2,\"name\":\"2. bean\",\"position\":\"2 2\"}," \
      "{\"id\":3,\"name\":\"3. bean\",\"position\":\"3 3\"}," \
      "{\"id\":4,\"name\":\"4. bean\",\"position\":\"4 4\"}]"
  end

  it 'returns one bean' do
    get '/api/beans/1'
    expect(body).to eq \
      "{\"id\":1,\"name\":\"1. bean\",\"position\":\"1 1\"}"
  end

  it 'creates one bean' do
    post '/api/beans', name: 'API created one', position: '5 5'
    expect(status).to eq 201
    expect(headers['location']).to eq 'http://example.org/api/beans/5'
  end

  it 'deletes one bean' do
    delete '/api/beans/1'
    expect(status).to eq 204
    get '/api/beans'
    expect(body).to eq \
      "[{\"id\":2,\"name\":\"2. bean\",\"position\":\"2 2\"}," \
      "{\"id\":3,\"name\":\"3. bean\",\"position\":\"3 3\"}," \
      "{\"id\":4,\"name\":\"4. bean\",\"position\":\"4 4\"}]"
  end

  it 'updates one bean' do
    put '/api/beans/1', name: 'API changed one', position: '1 1'
    expect(status).to eq 204
    get '/api/beans/1'
    expect(body).to eq \
      "{\"id\":1,\"name\":\"API changed one\",\"position\":\"1 1\"}"
  end
end
