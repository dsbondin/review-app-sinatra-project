class ReviewsController < ApplicationController

  get '/reviews/:id/new' do
    # raise params.inspect
    if logged_in?
      @product = Product.find(params[:id])
      erb :'reviews/new'
    else
      session[:notice] = "You must be logged in to add a product review"
      redirect '/login'
    end
  end

  post '/reviews/:product_id' do
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
    # check if a user is logged in , but if they aren't redirect to login with amessage they need to login
    authenticate_user
    @review = Review.find(params[:review_id])
    if @review.user == current_user
      erb :'reviews/edit'
    else
      session[:notice] = "You cannot edit this review"
      redirect "/products/#{@review.product.id}"
    end
  end

  post '/reviews/:review_id/edit' do
    authenticate_user
    @review = Review.find(params[:review_id])
    if @review.user == current_user
      @review.update(content: params[:content], rating: params[:rating])
    else
      session[:notice] = "You cannot edit this review"
    end

    redirect "/products/#{@review.product.id}"
  end

  get '/reviews/:review_id/delete' do
    @review = Review.find(params[:review_id])
    @review.delete if logged_in? and @review.user == current_user
    redirect "/products/#{@review.product.id}"
  end

end
