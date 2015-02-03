module App
  class Main < Roda
    plugin :render, engine: 'haml'

    include Domain::Store

    route do |r|
      r.root do
        render 'index', locals: { beans: store.read(:beans).main_page }
      end
    end
  end
end