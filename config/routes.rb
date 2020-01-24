Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # root to: 'products#index'
  root to: 'products#welcome'

  resources :products do
    resources :reviews
  end
end
