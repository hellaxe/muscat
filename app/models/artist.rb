class Artist < ActiveRecord::Base
  attr_accessible :description, :name, :genre_ids, :photo
  has_many :albums, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_and_belongs_to_many :genres
  has_attached_file :photo, styles: {medium: '300x300', small: '150x150', thumb: '64x64'}

  validates :name, :description, presence: true
  validates :name, uniqueness: true

end
