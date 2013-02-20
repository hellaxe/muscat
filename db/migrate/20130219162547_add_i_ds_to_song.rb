class AddIDsToSong < ActiveRecord::Migration
  def change
    add_column :songs, :artist_id, :integer
    add_column :songs, :album_id, :integer
    add_index :songs, :artist_id
    add_index :songs, :album_id
  end
end
