#Created 4/13/2019 by Leslie Zhou
## This is the controller for controlling all the methods for reviews
# # Edited 4/15/2019 by Renzhi Hu
# #Editied 4/17/2019 by Leslie Zhou : make sure the review is linked to the books and users
class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_book

  def new
    @review = Review.new
  end
  def index
    @reviews = Review.all
  end
  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to user_review_path
    else
      puts "Error! Your Review wasn't updated!"
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy

    @review.destroy
    redirect_to user_review_path
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.book_id = @book.id

    if @review.save!
      redirect_to book_path(@book)
    else
      puts "Error! Your Review wasn't posted!"
    end
  end
  private
  def review_params
    params.require(:review).permit(:body, :rating)
  end
  def find_book
    #tells rails if the Reviews is for Reviews or for reviews
    @book = Book.find(params[:book_id])
  end
end
