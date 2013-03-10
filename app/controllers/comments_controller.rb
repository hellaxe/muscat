class CommentsController < InheritedResources::Base
  def index
    @commentable = find_commentable
    @comments = @commentable.comments.order('created_at desc').page(params[:page]).per(20)
  end

  def new
    @commentable = find_commentable
    @comment = Comment.new
  end
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.user = current_or_guest_user
    create! { |format|
      format.html { redirect_to @commentable}
    }
  end

  def edit
    @commentable = find_commentable
    @comment = @commentable.comments.find(params[:id])
    edit!
  end

  def update
    @commentable = find_commentable
    @comment = @commentable.comments.update(params[:comment])
  end

  def destroy

  end

  private
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/ && name != 'user_id'
        return $1.classify.constantize.find(value)
      end
    end
  end
end
