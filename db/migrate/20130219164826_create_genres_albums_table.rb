class CreateGenresAlbumsTable < ActiveRecord::Migration
  def up
    create_table :albums_genres, id: false do |t|
      t.references :album, :genre
    end
    add_index :albums_genres, [:album_id, :genre_id]
  end

  def down
    drop_table :albums_genres
  end
end
