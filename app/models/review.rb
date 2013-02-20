class Review < ActiveRecord::Base
  attr_accessible :album_id, :artist_id, :content, :name, :user_id
  belongs_to :user
  belongs_to :album
  belongs_to :artist
end
