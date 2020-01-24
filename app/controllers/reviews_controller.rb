class ReviewsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do
    flash[:alert] = 'The record you tried to access no longer exists.'
    render :sorry   # or e.g. redirect_to :action => :index
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully created!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "There was a problem creating this review!"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def update
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated!"
      redirect_to product_path(@review.product)
    else
      flash[:alert] = "There was a problem updating this review!"
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Review successfully removed!"

    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end

  private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end

end
