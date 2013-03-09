require 'spec_helper'

describe ReviewsController do
  context "as user" do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:default_user]
      @user = FactoryGirl.create(:default_user)
      # @user.confirm!
      sign_in @user
      @review = FactoryGirl.create(:review, user: @user, artist: FactoryGirl.create(:artist))
    end
    describe "get#" do
      it "index" do
        get :index
        response.should render_template :index
      end
    end
  end
  context "as guest" do

  end
  context "as anonymous" do

  end
end
