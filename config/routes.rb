BalanceApp::Application.routes.draw do

	root to: 'pages#home'
	get '/home', to: 'pages#home'

	get '/signup', to: 'users#new'
  resources :users, only: [:create]

	get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :accounts, only: [:index, :show]

  resources :transactions, except: [:show] do
    get 'search', on: :collection
  end

  post '/notify/bal', to: 'send_text#balance_info'
  post '/notify/rem', to: 'send_text#update_reminder' #not yet scheduled to run

end
