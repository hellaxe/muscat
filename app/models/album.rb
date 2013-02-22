class Album < ActiveRecord::Base
  attr_accessible :name, :artist_id, :cover
  belongs_to :artist
  has_many :reviews
  has_many :songs
  has_and_belongs_to_many :genres

  has_attached_file :cover, styles: {medium: '350x350', small: '150x150', thumb: '64x64'}

  validates :name, :artist_id, presence: true
end
