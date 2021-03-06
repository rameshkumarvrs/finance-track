Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  get 'stocks/search'
  #get 'users/my_portfolio'
  #post 'my_projects', to: 'projects#add_projects'
  get 'my_projects', to: 'projects#add_projects'
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friend', to: 'users#search'
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :projects

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
