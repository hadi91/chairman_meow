Rails.application.routes.draw do

  devise_for :users
  # resources :products, only: [:index, :show]
  # resource :cart, except: [:new, :create]
#
  # namespace :shopping do
  # resources :orders, except: [:edit, :update]
  # resources :products, only: [:index, :show]
  # resource :cart, except: [:new, :create]
  # end
#
  # namespace :admin do
  # resources :orders, except: [:new, :create, :destroy]
  resources :products
  # end
#
  root "products#index"
end
