class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_name, :guest,
                  :avatar

  has_many :reviews, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_attached_file :avatar, styles: {medium: '200x200', small: '64x64#', thumb: '16x16#'},
                    default_url: '/system/avatar_:style_missing.png'

  validates :user_name, presence: true, uniqueness: true

  def to_s
    self.user_name
  end
end
