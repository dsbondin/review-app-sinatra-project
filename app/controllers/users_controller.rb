class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect '/products'
    end
  end

  post '/signup' do
    if username_taken?
      session[:notice] = "This username is taken, please try something else."
      redirect '/signup'
    elsif !params[:username].empty? and !params[:password].empty?
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect '/products'
    else
      session[:notice] = "Username or password can't be empty."
      redirect '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/products'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/products'
    else
      session[:notice] = "Incorrect username or password, please try again."
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear if session[:user_id]
    redirect '/'
  end


end
