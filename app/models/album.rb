class Album < ActiveRecord::Base
  attr_accessible :name, :artist_id, :cover, :songs_attributes, :release_date

  belongs_to :artist
  has_many :reviews, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_and_belongs_to_many :genres
  has_many :comments, as: :commentable
  has_attached_file :cover, styles: {medium: '350x350', small: '150x150', thumb: '64x64'},
                    default_url: "/system/:style_missing.png"

  accepts_nested_attributes_for :songs, allow_destroy: true

  validates :name, presence: true
  validates_associated :artist

  scope :latest, lambda {|n = 4| order('created_at desc').limit(n)}

  def songs_count
    self.songs.count
  end

  def songs_duration
    sum = 0
    self.songs.map {|song| sum += song.durability}
    time = Time.at(sum).utc
    if time.hour > 0
      time.strftime '%H:%M:%S'
    else
      time.strftime '%M:%S'
    end
  end
end
