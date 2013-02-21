class HomeController < ApplicationController
  def index
    @reviews = Review.order('created_at desc')
  end

  # Method POST
  def guest_login
    current_or_guest_user
    redirect_to root_path
  end

  # Method DELETE
  def guest_logout
    guest_user_log_out
    redirect_to root_path
  end
end
