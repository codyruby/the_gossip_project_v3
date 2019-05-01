Rails.application.routes.draw do
 
  get 'gossips/index'

  get 'gossips/show'

  get 'gossips/new'

  get 'gossips/create'

  get 'gossips/edit'

  get 'gossips/update'

  get 'gossips/destroy'

  get '/team', to: 'teams#index'
  get '/contact', to: 'contacts#index'
  get 'welcome/:id', to: 'welcomes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
