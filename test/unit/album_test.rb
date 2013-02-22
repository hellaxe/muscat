require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  setup do
    @album = Album.new(name: 'Album1',
                       artist_id: 1)
  end

  test 'valid album' do
    assert @album.valid?, 'album was invalid with right data'
  end

  test 'invalid album without name' do
    @album.name = nil
    assert @album.invalid?, 'album was valid without name'
  end

  test 'invalid album without artist' do
    @album.artist_id = nil
    assert @album.invalid?, 'album was valid without artist'
  end
end
