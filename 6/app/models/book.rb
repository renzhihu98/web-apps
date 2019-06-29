# Created 4/1/2019 by Kordell Stewarts
# Class to handle Book validations
# Edited 4/15/2019 by Renzhi Hu
class Book < ApplicationRecord
  #include ActiveModel::Validations
  #attr_accessible  :title, :author, :description
  validates :author, :presence => true, :length => {:minimum => 1, :maximum => 200}
  validates :title, :presence => true, :length => {:minimum => 1, :maximum => 200}
  validates :classification, :inclusion => { in: %w[Education Entertainment], message: "Please enter Education or Entertainment" }
  validates :genre, :length => {:minimum => 0, :maximum => 50}
  validates :edition, :length => {:minimum => 0,:maximum => 50}
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reviews
  has_many :comments
end
