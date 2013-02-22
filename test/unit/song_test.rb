require 'test_helper'

class SongTest < ActiveSupport::TestCase
  setup do
    @song = Song.new(name: "my song", durability: 100, artist_id: 1)
  end

  test 'valid song' do
    assert @song.valid?, 'song was invalid with right data'
  end

  test 'invalid song without durability' do
    @song.durability = nil
    assert @song.invalid?, 'song was valid without durability'
  end

  test 'invalid song without name' do
    @song.name = nil
    assert @song.invalid?, 'song was valid without name'
  end

  test 'invalid song without artist' do
    @song.artist_id = nil
    assert @song.invalid?, 'song was valid without artist'
  end
  # test "the truth" do
  #   assert true
  # end
end
