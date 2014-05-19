BalanceApp::Application.routes.draw do

	root to: 'pages#home'
	get '/home', to: 'pages#home'

	get '/signup', to: 'users#new'
  resources :users, only: [:create]

	get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  ## Great job here limiting the resources method to only what you need.
  ## You definitely don't want routes that do nothing hanging around.
  resources :accounts, only: [:index, :show]
  resources :transactions, except: [:show]

  post '/notify/bal', to: 'send_text#balance_info'
  post '/notify/rem', to: 'send_text#update_reminder' #not yet scheduled to run

end
