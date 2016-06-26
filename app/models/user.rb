class User < ActiveRecord::Base
  has_many :playlists
  has_many :artists, through: :playlists
  has_many :genres, through: :artists
  validates_uniqueness_of :name
end
