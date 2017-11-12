class UsersController < ApplicationController

  get '/users/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect '/products'
    end
  end

  get '/users/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/products'
    end
  end


end
