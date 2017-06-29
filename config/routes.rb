Rails.application.routes.draw do

  devise_for :admins, :controllers => { registrations: 'admins/registrations', sessions: 'admins/sessions', passwords: 'admins/passwords' }

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :products, only: [:index]
  resources :payments, only: [:new, :show, :create]

  namespace :meow do
    resources :products, only: [:index, :show] do
      collection do
        get 'newest'
        get 'premium'
        get 'search'
      end
    end
    resource :shopping_cart, except: [:new, :create]
    resource :line_item, only: [:create, :destroy, :update]
    resources :orders, only: [:index, :show]
  end

  namespace :admin do
    resources :orders, except: [:new, :create, :destroy] do
      collection do
        get :neworders
        get :pendingpayment
        get :paymentapproved
        get :awaitingpickup
        get :shipped
        get :delivered
        get :disputed
        get :refunded
        get :cancelled
      end
    end

    resources :products
  end

  root "products#index"
end
