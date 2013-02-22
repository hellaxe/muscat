require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    u = User.new
    u.save(:validate => false)
    @r = Review.new(name: 'name',
                    content: 'content',
                    artist_id: 1,
                    user_id: User.last.id)
  end

  test 'valid with right data' do
    assert @r.valid?, 'was invalid with right data'
  end

  test 'invalid without name' do
    @r.name = nil
    assert @r.invalid?, 'was valid without name'
  end

  test 'invalid without conent' do
    @r.content = nil
    assert @r.invalid?, 'was valid without content'
  end

  test 'invalid without artist' do
    @r.artist_id = nil
    assert @r.invalid?, 'was valid without artist'
  end

  test 'invalid with nonexistent user' do
    @r.user_id = 1000
    assert @r.invalid?, 'was valid with nonexistent user'
  end

  test 'invalid without user' do
    @r.user_id = nil
    assert @r.invalid?, 'was valid without user'
  end
end
