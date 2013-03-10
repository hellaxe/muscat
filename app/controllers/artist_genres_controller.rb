class ArtistGenresController < ApplicationController
  def index
  end

  def update
    genres = params[:user][:genre_ids]
    genres.reject!(&:blank?) if genres
    genres.each do |id|
      rating = ArtistGenre.find_or_create_by_artist_id_and_genre_id(params[:artist_id], id)
      rating.rate_up(current_or_guest_user)
    end
    @recent_genres = Artist.find(params[:artist_id]).artist_genres.highest_rated(5)
    respond_to do |format|
      format.js
    end
  end

  def edit_multiple
    @artist = Artist.find(params[:artist_id])
    @genres = @artist.artist_genres.highest_rated(4)
    @rating = Array.new
    @rating << ArtistGenre.new
    # TODO: make find user rated genres for current user scope
    #@user_genres = @artist.artist_genres.user_rated(current_or_guest_user)
    respond_to do |format|
      format.js
      format.html {redirect_to artist_path(@artist)}
    end
  end

end
