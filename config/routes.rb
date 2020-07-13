Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :movies, only: :index
      resources :pings, only: [:index], constraints: { format: 'json' }
    end
  end
end