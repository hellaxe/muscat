class Post < ActiveRecord::Base
  attr_accessible :content, :name, :user_id, :photo
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :comments, as: :commentable
  #TODO: field for image
  has_attached_file :photo, styles: {thumb: "64x64#", medium: "216x216"}
  validates :name, :content, presence: true
  validates_presence_of :user

  scope :latest, lambda { |count = 5| order('created_at desc').limit(count) }
end
