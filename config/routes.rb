Rails.application.routes.draw do
  root to: 'menus#index'
  devise_for :users
  resources :profiles
  resources :exercises
  resources :menus
  resources :workouts
  resources :body_statuses
  resource  :chart, only: [:show]
  resources  :calendars, only: [:show]
  resources :relationships, only: %i[index create destroy]
  resources :posts do
    resources :comments, except: :show
  end
  resources :likes, only: %i[index create destroy]
  resources :workout_logs, only: :index
end
