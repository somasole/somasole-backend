Rails.application.routes.draw do
  root 'featured#index'

  get '/featured', to: 'featured#index'
end
