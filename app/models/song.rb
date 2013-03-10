load 'lib/album_belongs_to_artist.rb'

class Song < ActiveRecord::Base
  include AlbumBelongsToArtist

  attr_accessible :durability, :name, :genre_ids, :album_id, :artist_id
  belongs_to :album
  belongs_to :artist
  has_and_belongs_to_many :genres
  has_many :comments, as: :commentable

  validates :name, :durability, presence: true
  validates :durability, numericality: { only_integer: true }
  validates_associated :artist
  #TODO: Make artist association
  #TODO: Make nested resource route
  def durability_in_time
    time = Time.at(self.durability).utc

    if time.hour > 0
      time.strftime '%H:%M:%S'
    else
      time.strftime '%M:%S'
    end

  end


end
