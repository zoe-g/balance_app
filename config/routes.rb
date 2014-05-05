BalanceApp::Application.routes.draw do

	resources :accounts, :transactions, :users, :sessions

	root to: 'pages#home'

	get '/signup', to: 'users#new'
	get'/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  
end
