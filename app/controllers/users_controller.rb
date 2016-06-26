class UsersController < ApplicationController
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # Now you can access user's private data, create playlists and much more

    name = spotify_user.email
    playlists = spotify_user.playlists(limit: 10)
    artists = []
    genres = []

    playlists.each do |pl|
      pl.tracks.each do |track|
        unless artists.include?(track.artists.first.name)
          artists << track.artists.first.name
          genres << track.artists.first.genres.first if !track.artists.first.genres.empty?
        end
      end
    end

    user = User.new(name: name)
    user.save

    @name = name
    @playlists = playlists
    @artists = artists
    @genres = genres
  end
end
