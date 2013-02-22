require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  setup do
    @album = albums(:one)
  end

  test "shouldn't get index" do
    get :index
    assert_redirected_to root_path
  end

  test "shouldn't get new" do
    get :new
    assert_redirected_to root_path
  end

  test "shouldn't create album" do
    assert_difference('Album.count') do
      post :create, album: { name: @album.name }
    end

    assert_redirected_to album_path(assigns(:album))
  end

  test "shouldn't show album" do
    get :show, id: @album
    assert_redirected_to root_path
  end

  test "shouldn't get edit" do
    get :edit, id: @album
    assert_redirected_to root_path
  end

  test "shouldn't update album" do
    put :update, id: @album, album: { name: @album.name }
    assert_redirected_to root_path
  end

  test "shouldn't destroy album" do
    assert_redirected_to root_path
  end
end
