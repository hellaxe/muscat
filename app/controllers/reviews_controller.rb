class ReviewsController < InheritedResources::Base
  actions :latest
  def latest
    @review = Review.last
  end
end
