class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_name, :guest

  has_many :reviews
  has_many :posts
  has_many :comments, as: :commentable

  has_attached_file :avatar, styles: {medium: '200x200', small: '64x64#', thumb: '32x32#'},
                    default_url: '/system/avatar_:style_missing.png'

  validates :user_name, presence: true, uniqueness: true

  def to_s
    self.user_name
  end
end
