Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'

  # can use namespace method instead of scope, module
  # NOTE: namespace changes URL helper method
  # scope '/admin', module: 'admin' do
  namespace :admin do
    resources :stats, only: [:index]
  end
end
