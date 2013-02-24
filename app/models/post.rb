class Post < ActiveRecord::Base
  attr_accessible :content, :name, :user_id
  belongs_to :user

  validates :name, :content, :user_id, presence: true
  validates_presence_of :user
end
