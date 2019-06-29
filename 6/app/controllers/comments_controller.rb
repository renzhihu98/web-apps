#Created 4/13/2019 by Leslie Zhou:
# This is the controller for controlling all the methods for comments
# Edited 4/15/2019 by Renzhi Hu
# #Editied 4/17/2019 by Leslie Zhou : make sure the comment is linked to the books and users
class CommentsController < ApplicationController
  before_action :find_book
  before_action :authenticate_user!

  def new
    @comment=Comment.new
  end
  def index
    @comments=Comment.all
  end
  def edit
    @comment=Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to user_comment_path
    else
      puts "Error! Your comment wasn't updated!"
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment=Comment.destroy(params[:id])
    redirect_to user_comment_path
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = @book.id
    if @comment.save!
      redirect_to book_path(@book)
    else
      puts "Error! Your comment wasn't posted!"
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
  def find_book
    @book = Book.find(params[:book_id])
  end
end
