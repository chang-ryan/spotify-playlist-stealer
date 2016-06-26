class AddUserRefToArtistLikes < ActiveRecord::Migration
  def change
    add_reference :artist_likes, :user, index: true, foreign_key: true
  end
end
