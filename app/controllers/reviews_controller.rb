class ReviewsController < InheritedResources::Base
  load_and_authorize_resource
  def create
    @review = Review.new params[:review]
    @review.user = current_or_guest_user
    create!
  end
end
