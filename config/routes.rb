Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#landing'

  # NOTE: 'param: :value' always requires a 'to_param' method in the model

  # Organizations
  resources :organizations, only: [:new, :create]
  get 'organizations/:url_token', to: 'organizations#show', param: :url_token, as: 'organization'

  # Circles (nested within organizations)
  post 'organizations/:url_token', to: 'circles#create', param: :url_token, as: 'circles'
  get 'organizations/:url_token/add_circle', to: 'circles#new', param: :url_token, as: 'new_circle'
end
