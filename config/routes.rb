Rails.application.routes.draw do
  get 'users/show'
  root 'events#index'
  get 'static_pages/index'
  devise_for :users
  resources :users, only: [:show]
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
