Rails.application.routes.draw do
  root 'featured#index'

  get '/featured', to: 'featured#index'
  put '/featured/update_videos', to: 'featured#update_videos'
  put '/featured/update_workout', to: 'featured#update_workout'

  resources :articles, only: %i[update]

  resources :videos, only: %i[index update]

  resources :workouts, only: %i[index update] do
    resources :circuits, only: %i[update] do
      resources :movements, only: %i[update]
    end
  end
end
