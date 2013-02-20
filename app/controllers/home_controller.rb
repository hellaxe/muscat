class HomeController < ApplicationController
  def index
    @review = Review.last
  end
end
