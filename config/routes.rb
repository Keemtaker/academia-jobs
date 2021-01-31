Rails.application.routes.draw do
  root to: 'pages#home'
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  resources :jobs do
    get 'payment', to: 'jobs#payment'
  end

  get 'about', to: 'pages#about'
  get 'home', to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
