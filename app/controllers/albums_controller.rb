class AlbumsController < InheritedResources::Base
  load_and_authorize_resource
  before_filter do
    @artist = Artist.find(params[:artist_id])
  end
  def index
    @albums = @artist.albums
    index!
  end
  def new
    @album = @artist.albums.build
    new!
  end
  def create
    @album = @artist.albums.build(params[:album])
    create! {artist_album_path(@artist, @album)}
  end
  def update
    update! {artist_album_path(@artist, @album)}
  end
  def show
    @album = @artist.albums.find(params[:id])
    show!
  end
end
