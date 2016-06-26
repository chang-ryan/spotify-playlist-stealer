class Artist < ActiveRecord::Base
  has_many :artist_likes
  has_many :users, through: :artist_likes
  validates_uniqueness_of :name
end
