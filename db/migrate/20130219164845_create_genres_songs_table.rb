class CreateGenresSongsTable < ActiveRecord::Migration
  def up
    create_table :genres_songs, id: false do |t|
      t.references :genre, :song
    end
    add_index :genres_songs, [:genre_id, :song_id]
  end

  def down
    drop_table :genres_songs
  end
end
