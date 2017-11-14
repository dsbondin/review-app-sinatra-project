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

  post '/reviews/:id/new' do
    @product = Product.find(params[:id])
    if params[:content].empty? or params[:rating] == nil
      session[:notice] = "Please fill in the review field and rate the product"
      redirect "/reviews/#{@product.id}/new"
    else
      @review = @product.reviews.create(content: params[:content], rating: params[:rating].to_i, user_id: current_user.id)
      redirect "/products/#{@product.id}"
    end
  end

  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    if logged_in? and @review.user == current_user
      erb :'reviews/edit'
    else
      session[:notice] = "You cannot edit this review"
      redirect "/products/#{@review.product.id}"
    end
  end

end
