module App
  # Public: Bean JSON REST API
  class API < Roda
    plugin :json
    plugin :all_verbs

    route do |r|
      r.is 'ping' do
        { ping: 'pong' }
      end

      r.on 'beans' do
        r.get do
          r.is do
            store.read(:beans).all.to_a
          end

          r.is :id do |id|
            # FIXME: investigate why it is no working without to_h
            store.read(:beans).by_id(id).first.to_h
          end
        end

        r.post do
          id = store.command(:beans).try do
            create(name: r['name'], position: r['position'])
          end.value[:id]
          response.headers['location'] = "#{r.url}/#{id}"
          response.status = 201
        end

        r.delete :id do |id|
          store.command(:beans).try { delete(:by_id, id) }
          response.status = 204
        end

        r.put :id do |id|
          store.command(:beans).try do
            update(:by_id, id).set(name: r['name'], position: r['position'])
          end
          response.status = 204
        end
      end
    end
  end
end
