Rails.application.routes.draw do
  
  get 'comments/index'

  get 'comments/show'

  get 'comments/new'

  get 'comments/create'

  get 'comments/edit'

  get 'comments/update'

  get 'comments/destroy'

  resources :users do 
    resources :gossips 
  end

  resources :cities
  
  get '/team', to: 'teams#index'
  get '/contact', to: 'contacts#index'
  get 'welcome/:id', to: 'welcomes#index'
  root "gossips#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
