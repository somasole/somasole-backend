Rails.application.routes.draw do
  root 'featured#index'

  get '/featured', to: 'featured#index'
  put '/featured/update_videos', to: 'featured#update_videos'
  put '/featured/update_workout', to: 'featured#update_workout'

  resources :articles, only: %i[new create update destroy]

  resources :videos, only: %i[index update destroy]

  resources :workouts, only: %i[index update destroy] do
    resources :circuits, only: %i[update destroy] do
      resources :movements, only: %i[update destroy]
    end
  end
end
