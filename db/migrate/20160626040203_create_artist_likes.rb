class CreateArtistLikes < ActiveRecord::Migration
  def change
    create_table :artist_likes do |t|

      t.timestamps null: false
    end
  end
end
