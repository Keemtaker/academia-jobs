Rails.application.routes.draw do
  root to: 'jobs#index'
  resources :jobs, only: [:index, :new, :create, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
