# This model class is table for user representation in Rails
# Created 4-12-19 by Anna Yu
# Edited 4-14-19 by Anna Yu: added validations for username and added confirmable
# Edited 4/15/2019 by Renzhi Hu
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :email, length: {maximum: 254}
  validates :username, presence: :true, uniqueness: { case_sensitive: false },
            length: { maximum:36 }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  has_many :books
  has_many :reviews
  has_many :comments
end
