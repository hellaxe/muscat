class DropArtistsGenresTable < ActiveRecord::Migration
  def up
    drop_table :artists_genres
  end

  def down
    create_table :artists_genres, id: false do |t|
      t.references :genre, :artist
    end
    add_index :artists_genres, [:artist_id, :genre_id]
  end
end
