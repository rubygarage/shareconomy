Shareconomy::Engine.routes.draw do
  mount_devise_token_auth_for Shareconomy::User.name, at: 'api/v1/auth'
  resources :listings, only: [:index, :new, :show, :create]
end
