class SongsController < InheritedResources::Base
  load_and_authorize_resource
  before_filter do
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:album_id])
  end
  def index
    @album.songs
  end
  def update
    update! { artist_album_song_path(@artist, @album, @song) }
  end

end
