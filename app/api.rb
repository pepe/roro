module App
  class API < Roda
    plugin :json
    route do |r|
      r.is 'ping' do
        { ping: 'pong' }
      end

      r.on 'beans' do
        r.is do
          store.read(:beans).all.to_a
        end

        r.is :id do |id|
          # FIXME: investigate why it is no working without to_json
          store.read(:beans).by_id(id).first.to_json
        end
      end
    end
  end
end
