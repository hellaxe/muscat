class Album < ActiveRecord::Base
  attr_accessible :name, :artist_id, :cover
  belongs_to :artist
  has_many :reviews
  has_and_belongs_to_many :songs
  has_and_belongs_to_many :genres
  accepts_nested_attributes_for :songs, :genres, :reject_if => :all_blank, :allow_destroy => true
  has_attached_file :cover, styles: {medium: "350x350", small: "150x150"}
end
