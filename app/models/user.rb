class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :liked_post, through: :likes, source: :post

  has_many :comments, dependent: :destroy
  has_many :commented_post, through: :comments, source: :post
end
