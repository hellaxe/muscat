class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :content
      t.integer :user_id
      t.integer :album_id
      t.integer :artist_id

      t.timestamps
    end
    add_index :reviews, :user_id
    add_index :reviews, :album_id
    add_index :reviews, :artist_id
  end
end
