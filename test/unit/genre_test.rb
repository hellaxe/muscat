require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  setup do
    @g = Genre.new(name: 'Some genre')
  end

  test 'valid with right data' do
    assert @g.valid?, 'was not valid with right data'
  end

  test 'invalid without name' do
    @g.name = nil
    assert @g.invalid?, 'was valid without name'
  end

  test 'invalid with non unique name' do
    @g.name = 'Metal'
    assert @g.invalid?, 'was valid with non unique name'
  end
end
