Rails.application.routes.draw do
  get 'videos/index'

  get 'videos/update'

  root 'featured#index'

  get '/featured', to: 'featured#index'
  put '/featured/update_videos', to: 'featured#update_videos'
  put '/featured/update_workout', to: 'featured#update_workout'

  resources :articles, only: %i[update]

  resources :videos, only: %i[index update]
end
