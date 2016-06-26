class UsersController < ApplicationController
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # Now you can access user's private data, create playlists and much more

    name = spotify_user.email
    playlists = spotify_user.playlists(limit: 2)
    artists = [] # strings go in here
    genres = [] # strings go in here

    user = User.find_or_create_by(name: name)

    playlists.each do |list|
      list.tracks(limit: 50).each do |track|
        artist = track.artists.first
        genre = artist.genres.first.downcase
        artists << artist.name unless artists.include?(artist.name) # pushes string
        genres << genre if genre and !genres.include?(genre) # pushes string
      end
    end

    new_or_found_artists = artists.collect { |name| Artist.find_or_create_by(name: name) }
    user.artists = new_or_found_artists

    new_or_found_genres = genres.collect { |name| Genre.find_or_create_by(name: name)}
    user.genres = new_or_found_genres

    @name = user.name
    @playlists = playlists
    @artists = user.artists
    @genres = user.genres
  end
end
