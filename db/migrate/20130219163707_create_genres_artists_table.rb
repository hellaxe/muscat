class CreateGenresArtistsTable < ActiveRecord::Migration
  def up
    create_table :artists_genres, id: false do |t|
      t.references :genre, :artist
    end
    add_index :artists_genres, [:artist_id, :genre_id]
  end

  def down
    drop_table :artists_genres
  end
end
