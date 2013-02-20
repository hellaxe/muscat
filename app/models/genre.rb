class Genre < ActiveRecord::Base
  attr_accessible :description, :name
  has_and_belongs_to_many :albums
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :songs
end
