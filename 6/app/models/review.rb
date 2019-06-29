#Created 4/14/2019 by Leslie Zhou
# Edited 4/15/2019 by Renzhi Hu
# #This is the file for the review model
class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :rating, presence: true, length: {minimum: 1, maximum: 1, message: "An integer between 0 and 5"}
  validates_format_of :rating, with: /^[0-5]$/,  :multiline => true
  validates :body, presence: true, length: { minumum: 1, maximum: 1000, message:"Word limit: 1000" }
end
