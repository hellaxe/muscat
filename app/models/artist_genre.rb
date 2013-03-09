class ArtistGenre < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :genre
  belongs_to :artist
  has_reputation :rating, source: :user
  # bug with scope TODO: fix it
  scope :highest_rated, lambda {|n = 2| find_with_reputation(:rating, :all, order: 'rating desc', limit: n) }

  #scope :user_rated, lambda {|current_user|}

  def rating
    self.reputation_for(:rating)
  end

  def rate_up(current_user)
    unless self.has_evaluation?(:rating, current_user)
      self.add_evaluation(:rating, 1, current_user)
    end
    self
  end
end
