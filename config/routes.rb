Rails.application.routes.draw do
  root 'home#index'

  get '/artists/:id', to: 'artists#show', as: 'artist'
  get '/artists', to: 'artists#index'

  get '/auth/spotify/callback', to: 'users#spotify'
end
