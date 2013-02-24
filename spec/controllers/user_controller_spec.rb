require 'spec_helper'

describe UsersController do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:default_user]
    @user = FactoryGirl.create(:default_user)
    # @user.confirm!
    sign_in @user
  end

  it "should have a current user" do
    subject.current_user.should_not be_nil
    subject.current_user.id.should == @user.id
  end

  context "logged as user" do

    describe "#get" do

      it "should get index" do
        get :index
        # TODO: make some for check all users
        assigns(:users).should include(@user)
      end

      it "should render index template" do
        get :index
        response.should render_template :index
      end

      it "should get one user" do
        get :show, id: @user.id
        assigns(:user).should eq(@user)
      end

      it "should render show template" do
        get :show, id: @user.id
        response.should render_template :show
      end

    end

    describe "#post" do

      before :each do
        @other_user_attributes = FactoryGirl.attributes_for(:user)
      end

      it "should redirect to root" do
        post :create, user: @other_user_attributes
        response.should redirect_to root_url
      end

      it "should't create user" do
        expect {
          post :create, user: @other_user_attributes
        }.to_not change(User,:count)
      end
    end

    describe "#put" do

      context "try update yourself" do
        before :each do
          @attributes = FactoryGirl.attributes_for(:default_user,
                                                   user_name: "new_name")
        end
        it "should update yourself" do
          put :update, id: @user.id, user: @attributes
          @user.reload
          @user.user_name.should eq("new_name")
        end

        it "should redirect to user" do
          put :update, id: @user.id, user: @attributes
          response.should redirect_to user_path(@user)
        end
      end

      context "try to update other user" do

        before :each do
          @other_user_attributes = FactoryGirl.attributes_for(:user)
          @other_user = User.create(@other_user_attributes)
          @other_user.save
          @other_user_attributes[:user_name] = "some_name"
        end

        it "shouldn't update other user" do
          put :update, id: @other_user.id, user: @other_user_attributes
          @other_user.reload
          @other_user.user_name.should_not eq("some_name")
        end

        it "should redirect to root" do
          put :update, id: @other_user.id, user: @other_user_attributes
          response.should redirect_to root_url
        end

      end
    end

    describe "#destroy" do

      before :each do
        @other_user = FactoryGirl.create(:user)
      end

      it "shouldn't delete user" do
        expect {
          delete :destroy, id: @other_user.id
        }.to_not change(User,:count)
        expect {
          delete :destroy, id: @user.id
        }.to_not change(User,:count)
      end

      it "should redirect to root" do
        delete :destroy, id: @other_user.id
        response.should redirect_to root_url
      end

      it "should print error message" do
        delete :destroy, id: @other_user.id
        flash[:alert].should == "You haven't permissions to this action"
      end
    end
  end




end
