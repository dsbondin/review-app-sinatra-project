class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "its_not_a_secret"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id]) or nil
    end

    def username_taken?
      !!User.find_by(username: params[:username])
    end
  end

  get '/' do
    erb :index
  end

end
