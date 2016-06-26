class UsersController < ApplicationController
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # Now you can access user's private data, create playlists and much more

    name = spotify_user.email
    playlists = spotify_user.playlists(limit: 2)
    artists = []
    genres = []

    user = User.find_or_create_by(name: name)

    playlists.each do |list|
      list.tracks(limit: 50).each do |track|
        artist = track.artists.first
        genre = artist.genres.first
        artists << artist.name unless artists.include?(artist.name)
        genres << genre if genre and !genres.include?(genre)
      end
    end

    new_or_found_artists = artists.collect { |name| Artist.find_or_create_by(name: name) }
    user.artists = new_or_found_artists

    @name = name
    @playlists = playlists
    @artists = user.artists
    @genres = genres
  end
end
