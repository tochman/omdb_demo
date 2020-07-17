Rails.application.routes.draw do
  
  mount_devise_token_auth_for 'User', at: 'api/v0/auth', controllers: {
    registrations: :facebook_login
  }
  namespace :api do
    namespace :v0 do
      resources :movies, only: :index
      resources :pings, only: [:index], constraints: { format: 'json' }
      resources :watchlist_items, only: [:create], constraints: { format: 'json' }
      resources :subscriptions, only: [:create], constraints: { format: 'json' }
    end
  end
end