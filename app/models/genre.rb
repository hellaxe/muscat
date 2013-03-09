class Genre < ActiveRecord::Base
  attr_accessible :description, :name
  has_and_belongs_to_many :albums
  has_many :artist_genres
  has_many :artists, through: :artist_genres
  has_and_belongs_to_many :songs

  validates :name, presence: true, uniqueness: true
end