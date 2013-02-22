require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  setup do
    @artist = Artist.new(name: 'Some name',
                         description: 'Some Description')
  end

  test 'valid artist' do
    assert @artist.valid?, 'was not valid with right data'
  end

  test 'invalid artist without name' do
    @artist.name = nil
    assert @artist.invalid?, 'was valid without name'
  end

  test 'invalid artist without description' do
    @artist.description = nil
    assert @artist.invalid?, 'was valid without descrition'
  end

  test 'invalid artist with non unique name' do
    @artist.name = 'Rainbow'
    assert @artist.invalid?, 'was valid with non uniq name'
  end
end
