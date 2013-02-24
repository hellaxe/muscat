require 'spec_helper'

describe User do
  before :each do
    @user = FactoryGirl.build(:user)
  end

  it 'is valid' do
    @user.save.should == true
  end

  it 'is invaild without password' do
    @user.password = nil
    @user.save.should == false
    @user.password = '132'
    @user.save.should == false
  end

  it 'to_s returns name as a string' do
    @user.to_s.should == @user.user_name
    FactoryGirl.create(:user)
    FactoryGirl.create(:user)
    FactoryGirl.create(:user)
  end

end
