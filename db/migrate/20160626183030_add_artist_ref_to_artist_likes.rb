class AddArtistRefToArtistLikes < ActiveRecord::Migration
  def change
    add_reference :artist_likes, :artist, index: true, foreign_key: true
  end
end
