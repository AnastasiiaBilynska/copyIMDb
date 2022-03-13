Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  resources :movies, only: %i[show index] do
    resources :reviews
  end

  namespace :admins do
    resources :movies do
      resources :reviews
    end
    root 'admin/movies#index'
  end
  root 'movies#index'
end
