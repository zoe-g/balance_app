BalanceApp::Application.routes.draw do

	resources :accounts, :transactions, :users, :sessions

	root to: 'pages#home'

end
