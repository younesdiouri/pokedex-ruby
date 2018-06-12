Rails.application.routes.draw do
  resources :types
  root 'home#index'
  resources :pokemons
end
