Rails.application.routes.draw do

  devise_for :admins, :controllers => { registrations: 'admins/registrations', sessions: 'admins/sessions', passwords: 'admins/passwords' }

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks" }

  namespace :browse do
    root "products#index"
    resources :products, only: [:index, :show]
    resource :shopping_cart, except: [:new, :create]
    resource :line_item, only: [:create, :destroy]
  end

  namespace :meow do
    #resources :orders, except: [:edit, :update]
    resources :products, only: [:index, :show]
    resource :shopping_cart, except: [:new, :create]
    resource :line_item, only: [:create, :destroy]
  end

  namespace :admin do
    resources :orders, except: [:new, :create, :destroy]
    resources :products
  end

end
