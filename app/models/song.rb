class Song < ActiveRecord::Base
  attr_accessible :durability, :name, :genre_ids, :album_id, :artist_id
  belongs_to :album
  belongs_to :artist
  has_and_belongs_to_many :genres

  validates :name, :durability, :artist_id, presence: true

  def durability_in_time
    "#{self.durability / 60}:#{self.durability - self.durability / 60 * 60}"
  end
end
