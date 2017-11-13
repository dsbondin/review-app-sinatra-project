class ProductsController < ApplicationController

  get '/products' do
    @products = Product.all
    erb :'/products/index'
  end

  get '/products/new' do
    if logged_in?
      erb :'/products/new'
    else
      session[:notice] = "You must be logged in to add a product"
      redirect '/login'
    end
  end

  post '/products' do
    if !params[:product_name].empty?
      product = Product.find_or_create_by(name: params[:product_name])
      redirect "/products/#{product.id}"
    else
      session[:notice] = "Product name can't be empty"
      redirect '/products/new'
    end
  end

  get '/products/:id' do
    @product = Product.find(params[:id])
    erb :'products/show'
  end


end
