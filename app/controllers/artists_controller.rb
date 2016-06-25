class ArtistsController < ApplicationController
  def index
    # spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    if !params[:artist_name].empty?
      @artists = RSpotify::Artist.search(params[:artist_name])
    else
      redirect_to root_path
    end
  end
  def show
  end
end
