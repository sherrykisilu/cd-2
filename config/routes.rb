Rails.application.routes.draw do
  resources :heros, only: [:index, :show]
  resources :powers, only: [:index, :show, :update]
  resources :hero_powers, only: [:create]
end
