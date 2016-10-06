Rails.application.routes.draw do
  get '/api/v1/items/random', to: 'api/v1/items#random'
  get '/api/v1/invoices/random', to: 'api/v1/invoices#random'
  get '/api/v1/invoice_items/random', to: 'api/v1/invoice_items#random'
  get '/api/v1/merchants/random', to: 'api/v1/merchants#random'
  get '/api/v1/transactions/random', to: 'api/v1/transactions#random'
  get '/api/v1/customers/random', to: 'api/v1/customers#random'

  get '/api/v1/items/find', to: 'api/v1/items/search#show'
  get '/api/v1/items/find_all', to: 'api/v1/items/search#index'

  get '/api/v1/invoice_items/find', to: 'api/v1/invoice_items/search#show'
  get '/api/v1/invoice_items/find_all', to: 'api/v1/invoice_items/search#index'

  get '/api/v1/invoices/find', to: 'api/v1/invoices/search#show'
  get '/api/v1/invoices/find_all', to: 'api/v1/invoices/search#index'

  get '/api/v1/merchants/find', to: 'api/v1/merchants/search#show'
  get '/api/v1/customers/find', to: 'api/v1/customers/search#show'
  get '/api/v1/transactions/find', to: 'api/v1/transactions/search#show'

  get '/api/v1/merchants/find_all', to: 'api/v1/merchants/search#index'
  get '/api/v1/customers/find_all', to: 'api/v1/customers/search#index'
  get '/api/v1/transactions/find_all', to: 'api/v1/transactions/search#index'

  get '/api/v1/merchants/:id/revenue', to: 'api/v1/merchants/single_merchant_revenue#show'
  get '/api/v1/merchants/:id/items', to: 'api/v1/merchants/items#index'
  get '/api/v1/merchants/:id/invoices', to: 'api/v1/merchants/invoices#index'

  get '/api/v1/invoices/:id/transactions', to: 'api/v1/invoices/transactions#index'
  get '/api/v1/invoices/:id/invoice_items', to: 'api/v1/invoices/invoice_items#index'
  get '/api/v1/invoices/:id/items', to: 'api/v1/invoices/items#index'
  get '/api/v1/invoices/:id/customer', to: 'api/v1/invoices/customer#show'
  get '/api/v1/invoices/:id/merchant', to: 'api/v1/invoices/merchant#show'

  get '/api/v1/invoice_items/:id/invoice', to: 'api/v1/invoice_items/invoice#show'
  get '/api/v1/invoice_items/:id/item', to: 'api/v1/invoice_items/item#show'




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
