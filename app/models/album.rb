class Album < ActiveRecord::Base
  attr_accessible :name, :artist_id, :cover, :songs_attributes
  belongs_to :artist
  has_many :reviews, dependent: :destroy
  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs, allow_destroy: true
  has_and_belongs_to_many :genres

  has_attached_file :cover, styles: {medium: '350x350', small: '150x150', thumb: '64x64'},
                    default_url: "/system/:style_missing.png"

  validates :name, presence: true
  validates_associated :artist

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
