class ReviewsController < InheritedResources::Base
  load_and_authorize_resource
  def create
    review = Review.new params[:review]
    review.user = current_or_guest_user
    review.save
    redirect_to reviews_path
  end
end
