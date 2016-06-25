Rails.application.routes.draw do
  root 'home#index'

  get '/artists/:id', to: 'artists#show', as: 'artist'
  get '/artists', to: 'artists#index'
end
