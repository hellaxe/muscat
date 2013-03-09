class PostsController < InheritedResources::Base
  load_and_authorize_resource

  def create
    @post.user_id = current_or_guest_user.id
    create!
  end
end
