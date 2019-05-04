Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]

  resources :users do 
    resources :gossips do
      resources :comments
    end
  end

  resources :cities
  
  get '/team', to: 'teams#index'
  get '/contact', to: 'contacts#index'
  get 'welcome/:id', to: 'welcomes#index'
  root "gossips#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
