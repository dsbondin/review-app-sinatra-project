class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "its_not_a_secret"
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

  end

  get '/' do
    erb :index
  end

private

  def authenticate_user
    if !logged_in?
      session[:notice]  = "You must be logged in to do this action"
      redirect '/login'
    end
  end

end
