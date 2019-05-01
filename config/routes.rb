Rails.application.routes.draw do
 
  resources :users do 
    resources :gossips 
  end
  
  get '/team', to: 'teams#index'
  get '/contact', to: 'contacts#index'
  get 'welcome/:id', to: 'welcomes#index'
  root "gossips#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
