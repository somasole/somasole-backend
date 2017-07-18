Rails.application.routes.draw do
  root 'featured#index'

  get '/featured', to: 'featured#index'

  resources :articles, only: %i[update]
end
