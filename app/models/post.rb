class Post < ActiveRecord::Base
  attr_accessible :content, :name, :user_id
  belongs_to :user

  validates :name, :content, presence: true
  validates_presence_of :user

  scope :latest, lambda { |count = 5| order('created_at desc').limit(count) }
end
