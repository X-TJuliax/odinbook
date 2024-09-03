class Post < ApplicationRecord
    belongs_to :user, foreign_key: 'user_id', class_name: 'User'
    has_many :likes, dependent: :destroy
    has_many :likers, through: :likes, source: :user

    has_many :comments, dependent: :destroy
    has_many :commenters, through: :comments, source: :user
end
