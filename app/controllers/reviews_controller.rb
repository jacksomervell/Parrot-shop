class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order('created_at DESC')
  end

  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    
    if review.save
      flash[:notice] = 'Review created successfully!'
      redirect_to review
    else
      flash.now[:error] = "Error: #{review.errors.full_messages}"
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])

    if review.update(review_params)
      redirect_to review
    else
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id]).destroy

    redirect_to root_path
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
