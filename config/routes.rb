Rails.application.routes.draw do
  get 'attendance/new'
  get 'attendance/index'
  get 'users/show'
  root 'events#index'
  get 'static_pages/index'
  devise_for :users
  resources :users, only: [:show]
  resources :events
  resources :charges
  resources :attendances
  get 'events/subscribe/:id', to: 'events#subscribe', as: 'event_subscribe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
