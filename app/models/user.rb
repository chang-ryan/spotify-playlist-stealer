class User < ActiveRecord::Base
  has_many :artist_likes
  has_many :artists, through: :artist_likes
  validates_uniqueness_of :name
end
