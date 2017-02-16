Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :users, only: [:show]
  resources :offers, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: :create
  end
  resources :bookings, only: :update
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
