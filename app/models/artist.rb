class Artist < ActiveRecord::Base
  attr_accessible :description, :name, :genre_ids, :photo
  has_many :reviews
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :albums
  has_and_belongs_to_many :songs
  has_attached_file :photo, styles: {medium: '300x300', small: '150x150', thumb: '64x64'}
  validates :name, :description, presence: true
end
