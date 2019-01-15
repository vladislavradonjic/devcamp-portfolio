Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'angular-items' to: 'portfolio#angular'
  get 'portfolio/:id', to: 'portfolio#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end

  root to: 'pages#home'
end
