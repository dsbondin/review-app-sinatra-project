class ReviewsController < ApplicationController

  get '/reviews/:id/new' do
    # raise params.inspect
    if logged_in?
      @product = Product.find(params[:id])
      erb :'reviews/new'
    else
      session[:notice]  = "You must be logged in to add a product review"
      redirect '/login'
    end
  end

end
