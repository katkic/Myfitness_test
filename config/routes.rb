Rails.application.routes.draw do
  root to: 'menus#index'
  devise_for :users
  resources :users, only: %i[index show]
  resources :exercises
  resources :menus
  resources :workouts
  resources :body_statuses
  resource  :chart, only: [:show]
  resource  :calendar, only: [:show]
  resources :relationships, only: %i[index create destroy]
  resources :posts
  resources :likes, only: %i[index create]
end
