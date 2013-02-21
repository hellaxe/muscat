class ReviewsController < InheritedResources::Base
  def create
    review = Review.new params[:review]
    review.user = current_user
    review.save
    redirect_to reviews_path
  end
end
