Rails.application.routes.draw do

  devise_for :admins
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :products, only: [:index, :show]
  #resource :shopping_cart, except: [:new, :create]

  namespace :meow do
    resources :orders, except: [:edit, :update]
    resources :products, only: [:index, :show]
    resource :shopping_cart, except: [:new, :create]
  end

  namespace :admin do
    resources :orders, except: [:new, :create, :destroy]
    resources :products
  end

  root "products#index"
end
