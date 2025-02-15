Rails.application.routes.draw do
  devise_for :users

  resources :books, only: [:index, :show] do
    post :borrow, on: :member
    post :return_book, on: :member
  end

  get 'profile', to: 'profiles#show', as: :profile

  root 'books#index'
end

