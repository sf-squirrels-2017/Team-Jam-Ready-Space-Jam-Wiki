Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :destroy] 
  get '/join' => 'users#new'
  root to: 'users#new'  
  
end
