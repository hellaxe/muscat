require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @p = Post.new(name: 'Name of Post',
                  content: 'blahblahblah',
                  user_id: 1)
  end

  test 'valid with right data' do
    u = User.new
    u.save(:validate => false)
    @p.user = User.last
    assert @p.valid?, 'was not valid with right data'
  end

  test 'invalid without name' do
    @p.name = nil
    assert @p.invalid?, 'was valid without name'
  end

  test 'invalid without content' do
    @p.content = nil
    assert @p.invalid?, 'was valid without content'
  end

  test 'invalid without user' do
    @p.user_id = nil
    assert @p.invalid?, 'was valid without user'
  end

  test 'invalid with nonexistent user' do
    @p.user_id = 1000
    assert @p.invalid?, 'was valid with nonexistent user'
  end
end
