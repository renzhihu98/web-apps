#created 4/13/2019 by Leslie Zhou
# Edited 4/15/2019 by Renzhi Hu

# This si the file for the comment model
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :body, presence: true, length: { minumum: 1, maximum: 500, message:"Word limit: 500" }
end
