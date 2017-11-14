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

  post '/reviews/:product_id/new' do
    @product = Product.find(params[:product_id])
    if params[:content].empty? or params[:rating] == nil
      session[:notice] = "Please fill in the review field and rate the product"
      redirect "/reviews/#{@product.id}/new"
    else
      @review = @product.reviews.create(content: params[:content], rating: params[:rating].to_i, user_id: current_user.id)
      redirect "/products/#{@product.id}"
    end
  end

  get '/reviews/:review_id/edit' do
    @review = Review.find(params[:review_id])
    if logged_in? and @review.user == current_user
      erb :'reviews/edit'
    else
      session[:notice] = "You cannot edit this review"
      redirect "/products/#{@review.product.id}"
    end
  end

  post '/reviews/:review_id/edit' do
    @review = Review.find(params[:review_id])
    @review.update(content: params[:content], rating: params[:rating])
    redirect "/products/#{@review.product.id}"
  end

  get '/reviews/:review_id/delete' do
    @review = Review.find(params[:review_id])
    @review.delete if logged_in? and @review.user == current_user
    redirect "/products/#{@review.product.id}"
  end

end
