Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#landing'

  # TODO: include url_token into target url when SHOWING an organization
  resources :organizations, only: [:new, :create, :show]
  # resources :organizations, only: [:new, :create]
  # The following line didn't work
  # get 'organizations/:url_token', to: 'organizations#show', param: :url_token, as: 'organization'

  # resources :circles, only: [:new]
end
