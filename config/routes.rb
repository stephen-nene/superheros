Rails.application.routes.draw do
  resources :powers
  resources :heros
  resources :hero_powers, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
