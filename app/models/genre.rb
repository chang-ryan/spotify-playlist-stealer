class Genre < ActiveRecord::Base
  has_many :genre_likes
  has_many :users, through: :genre_likes
  validates_uniqueness_of :name
end
