class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :content, :user_id
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  scope :latest, lambda {|n = 10| order('created_at desc').limit(n)}
  validates :content, presence: true
end


