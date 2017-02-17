Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  resources :users, only: [:new, :create, :destroy]
  get '/join' => 'users#new'
  root to: 'categories#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :categories , only: [:index, :show] do
    resources :articles
  end

  resources :articles, only: [:index], as: "all_articles"
  resources :citations

end
