require 'bundler'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end


module Gol
  class App < Sinatra::Application
    
    @@da_world = World.new
    @game = Set_up.new(@@da_world)
    @game.random_formation

    #configure
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'

      Compass.configuration do |config|
        config.project_path = File.dirname(__FILE__)
        config.sass_dir = 'views'
      end

      set :haml, { :format => :html5 }
      set :sass, Compass.sass_engine_options
      set :scss, Compass.sass_engine_options
    end

    #routes
    get '/' do
      erb :index
    end

    get '/gol' do
      @cur_world = @@da_world      
      @@da_world.tick!
      # if @cur_world.tick_ct == 20
      #   @refresh = ""
      # else
      #   @refresh = "<meta http-equiv='refresh' content='0.1' >"
      # end
      erb :gol
    end

    get '/custom.css' do
      scss :custom
    end

    #helpers
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end
    end

  end
end
