class CreateArtistGenres < ActiveRecord::Migration
  def change
    create_table :artist_genres do |t|
      t.references :artist
      t.references :genre
      t.timestamps
    end
    add_index :artist_genres, [:artist_id, :genre_id]
  end
end
