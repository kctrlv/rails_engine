Rails.application.routes.draw do
  get '/api/v1/items/random', to: 'api/v1/items#random'
  get '/api/v1/invoices/random', to: 'api/v1/invoices#random'
  get '/api/v1/invoice_items/random', to: 'api/v1/invoice_items#random'
  get '/api/v1/merchants/random', to: 'api/v1/merchants#random'
  get '/api/v1/transactions/random', to: 'api/v1/transactions#random'
  get '/api/v1/customers/random', to: 'api/v1/customers#random'

  get '/api/v1/merchants/find', to: 'api/v1/merchants/search#show'
  get '/api/v1/customers/find', to: 'api/v1/customers/search#show'


  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
    end
  end
end
