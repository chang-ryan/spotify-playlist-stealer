class CreateGenreLikes < ActiveRecord::Migration
  def change
    create_table :genre_likes do |t|
      t.references :genre, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
