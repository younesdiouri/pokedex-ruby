Rails.application.routes.draw do
  resources :moves
  resources :types
  root 'home#index'
  resources :pokemons
end
