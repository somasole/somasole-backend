Rails.application.routes.draw do
  devise_for :admins
  root 'featured#index'

  get '/featured', to: 'featured#index'
  put '/featured/update_videos', to: 'featured#update_videos'
  put '/featured/update_workout', to: 'featured#update_workout'

  resources :articles, only: %i[show new create update destroy]

  resources :videos, only: %i[index new create update destroy]

  resources :workouts, only: %i[index show new create update destroy] do
    resources :circuits, only: %i[create update destroy] do
      resources :movements, only: %i[create update destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      get '/featured', to: 'featured#index'

      resources :videos, only: :index

      resources :workouts, only: :index
    end
  end
end
