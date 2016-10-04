Rails.application.routes.draw do
  get '/api/v1/merchants/random', to: 'api/v1/merchants#random'
  get '/api/v1/transactions/random', to: 'api/v1/transactions#random'
  
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
