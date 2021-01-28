Rails.application.routes.draw do
  root to: 'jobs#index'
  resources :jobs do
    get 'payment', to: 'jobs#payment'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
