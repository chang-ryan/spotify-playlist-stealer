class User < ActiveRecord::Base
  has_many :playlists
  has_many :artists, through: :playlists
end
