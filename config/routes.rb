BalanceApp::Application.routes.draw do

	root to: 'pages#home'
	get '/home', to: 'pages#home'

	get '/signup', to: 'users#new'
  resources :users, only: [:create]

	get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :accounts, except: [:new, :create, :destroy]
  resources :transactions, except: [:show]
end
