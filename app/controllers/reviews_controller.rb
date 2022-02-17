class ReviewsController < ApplicationController
  before_action :find_list, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.list = @list

    if @review.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :movie_id)
  end

  def find_list
    @list = List.find(params[:list_id])
  end
end
