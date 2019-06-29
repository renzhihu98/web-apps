# Created by Anna Yu
# Edited 4/14/19 by Renzhi Hu: created profile, library, review, comment functions
# Edited 4/14/19 by Leslie Zhou: Linked review and comments
# Edited 4/15/2019 by Renzhi Hu
class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
  end

  def library
    @books = current_user.books
  end

  def review
    @reviews = current_user.reviews
  end

  def comment
    @comments = current_user.comments
  end
end