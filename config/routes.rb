Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # ~NH~ NOT SURE ABOUT THIS ONE!
  # devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  # }

  # root to: 'products#index'
  root to: 'products#welcome'


  resources :products do
    resources :reviews
  end

end
