class GenresController < InheritedResources::Base
  load_and_authorize_resource

  def show
    @artists = @genre.artists.page(params[:page]).per(18)
    show!
  end
end
