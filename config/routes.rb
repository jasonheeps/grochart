Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#landing'

  resources :organizations, only: [:new]
  # get 'organizations/:id/new_organization', to: 'organizations#new', as: 'new_organization'
end
