module App
  # Main routing app
  # All subapplications are also mounted here
  # Also contains the root of the app for now
  class Main < Roda
    plugin :render, engine: 'slim'

    include Domain::Store

    route do |r|
      r.root do
        render 'index', locals: { beans: store.read(:beans).main_page }
      end

      r.on 'api' do
        r.run API
      end
    end
  end
end
