class Genre < ActiveRecord::Base
  has_many :genre_likes
  has_many :users, through: :genre_likes
end
