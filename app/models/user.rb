class User < ActiveRecord::Base
  has_many :artist_likes
  has_many :artists, through: :artist_likes

  has_many :genre_likes
  has_many :genres, through: :genre_likes
  
  validates_uniqueness_of :name
end
