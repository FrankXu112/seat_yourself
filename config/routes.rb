Rails.application.routes.draw do
  root 'restaurants#index'

  resources :restaurants

  resources :users, only: [:new, :create, :show, :edit, :upadate, :destroy]

  resources :restaurants do
   resources :reservations, only: [:new, :create, :show, :destroy]
  end 

  resources :restaurants do
   resources :reviews, only: [:create, :show, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]
end
