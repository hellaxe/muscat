class Song < ActiveRecord::Base
  attr_accessible :durability, :name, :genre_ids, :album_id, :artist_id
  belongs_to :album
  belongs_to :artist
  has_and_belongs_to_many :genres
end
