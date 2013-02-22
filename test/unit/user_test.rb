require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(user_name: 'username',
                     email: 'some@mail.com',
                     password: 'mypassword123123')
  end
  test 'invaild without a name' do
    @user.user_name = nil
    assert @user.invalid?
  end

  test 'invalid without a email' do
    @user.email = nil
    assert @user.invalid?
  end

  test 'invalid with incorrect email' do
    @user.email = 'hell'
    assert @user.invalid?, "user was valid with #{@user.email}"
    @user.email = 'hell@'
    assert @user.invalid?, "user was valid with #{@user.email}"
    @user.email = 'hell@sf'
    assert @user.invalid?, "user was valid with #{@user.email}"
  end

  test 'invalid with short password' do
    @user.password = '123'
    assert @user.invalid?, "user was valid with #{@user.password}"
  end

  test 'invalid without password' do
    @user.password = nil
    assert @user.invalid?, 'user was valid without password'
  end

  test 'valid with right data' do
    assert @user.valid?
  end

end
