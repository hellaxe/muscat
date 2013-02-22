class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_ability
    if session[:guest_user_id]
      user = User.find(session[:guest_user_id])
    elsif user_signed_in?
      user = current_user
    end

    @current_ability ||= Ability.new(user)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: "You haven't permissions to this action"
  end

  def guest_or_user_signed_in?
    user_signed_in? || !session[:guest_user_id].nil?
  end

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      if session[:guest_user_id]
        logging_in
        guest_user_log_out
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user_log_out
    User.destroy(session[:guest_user_id])
    session[:guest_user_id] = nil
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user
    User.find(session[:guest_user_id] ||= create_guest_user.id)

  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
    session[:guest_user_id] = nil
    guest_user
  end

  private

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def logging_in
    guest_reviews = guest_user.reviews.all
    guest_reviews.each do |review|
      review.user_id = current_user.id
      review.save
    end
    # For example:
    # guest_comments = guest_user.comments.all
    # guest_comments.each do |comment|
    # comment.user_id = current_user.id
    # comment.save
    # end
  end

  def create_guest_user
    u = User.create(user_name: 'guest', email: "guest_#{Time.now.to_i}#{rand(99)}@example.com", guest: true)
    u.save(:validate => false)
    session[:guest_user_id] = u.id
    u
  end

  helper_method :guest_or_user_signed_in?, :current_or_guest_user, :guest_user_log_out
end
