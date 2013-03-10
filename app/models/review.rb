load 'lib/album_belongs_to_artist.rb'

class Review < ActiveRecord::Base
  include AlbumBelongsToArtist

  attr_accessible :album_id, :artist_id, :content, :name, :user_id
  belongs_to :user
  belongs_to :album
  belongs_to :artist
  has_many :comments, as: :commentable

  validates :name, :content, :artist_id, :user_id, presence: true
  validates_presence_of :user
  validate :album_belongs_to_artist

  # TODO: add rating

  scope :latest, lambda { |count = 3| order("created_at desc").limit(count)}
end
