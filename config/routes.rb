Rails.application.routes.draw do
  get 'videos/index'

  get 'videos/update'

  root 'featured#index'

  get '/featured', to: 'featured#index'

  resources :articles, only: %i[update]

  resources :videos, only: %i[index update]
end
