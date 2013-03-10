class ArtistsController < InheritedResources::Base
  load_and_authorize_resource
  def index
    @artists = Artist.page(params[:page]).per(18)
    index!
  end

  def show
    @recent_albums = @artist.albums.order('created_at desc').limit(4)
    @recent_genres = @artist.artist_genres.highest_rated(5)
    #@rating.add_evaluation(:rating, 1, current_or_guest_user)
    show!
  end
end
