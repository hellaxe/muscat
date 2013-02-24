class Album < ActiveRecord::Base
  attr_accessible :name, :artist_id, :cover
  belongs_to :artist
  has_many :reviews, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_and_belongs_to_many :genres

  has_attached_file :cover, styles: {medium: '350x350', small: '150x150', thumb: '64x64'}

  validates :name, presence: true
  validates_associated :artist
end
