Rails.application.routes.draw do
  resources :characters
  resources :campaigns
  resources :users
  root 'welcome#index'

  get '/register', to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
