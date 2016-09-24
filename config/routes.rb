Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  # get '/admin/stats', to: 'stats#index'
  # get '/admin/authors/new', to: 'authors#new'
  # get '/admin/authors/delete', to: 'authors#delete'
  # get '/admin/authors/create', to: 'authors#create'
  # get '/admin/comments/moderate', to: 'comments#moderate'

  # scope allows us to group all the routes above under /admin
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end
  # When we want to route with a module and use that module's name as the URL prefix
  # NOTE: Using namespace updates our URL helpers from stats_path to admin_stats_path
  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
