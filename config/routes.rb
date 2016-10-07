Rails.application.routes.draw do
<<<<<<< HEAD
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :items, only: [:index, :show] do
        collection do
          get 'random',             to: 'items#random'
          get 'find',               to: 'items/search#show'
          get 'find_all',           to: 'items/search#index'
          get ':id/invoice_items',  to: 'items/invoice_items#index'
          get ':id/merchant',       to: 'items/merchants#show'
        end
      end
=======
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

  # get '/api/v1/merchants/:id/revenue?date', to: 'api/v1/merchants/single_merchant_date_revenue#show'
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

  get '/api/v1/items/:id/invoice_items', to: 'api/v1/items/invoice_items#index'
  get '/api/v1/items/:id/merchant', to: 'api/v1/items/merchants#show'
>>>>>>> origin/46_single_merchant_revenue_by_date

      resources :invoices, only: [:index, :show] do
        collection do
          get 'random',             to: 'invoices#random'
          get 'find',               to: 'invoices/search#show'
          get 'find_all',           to: 'invoices/search#index'
          get ':id/transactions',   to: 'invoices/transactions#index'
          get ':id/invoice_items',  to: 'invoices/invoice_items#index'
          get ':id/items',          to: 'invoices/items#index'
          get ':id/customer',       to: 'invoices/customer#show'
          get ':id/merchant',       to: 'invoices/merchant#show'
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get 'random',       to: 'invoice_items#random'
          get 'find',         to: 'invoice_items/search#show'
          get 'find_all',     to: 'invoice_items/search#index'
          get ':id/invoice',  to: 'invoice_items/invoice#show'
          get ':id/item',     to: 'invoice_items/item#show'
        end
      end

      resources :merchants, only: [:index, :show] do
        collection do
          get 'random',                 to: 'merchants#random'
          get 'find',                   to: 'merchants/search#show'
          get 'find_all',               to: 'merchants/search#index'
          get ':id/revenue',            to: 'merchants/single_merchant_revenue#show'
          get ':id/items',              to: 'merchants/items#index'
          get ':id/invoices',           to: 'merchants/invoices#index'
          get ":id/customers_with_pending_invoices", to: 'merchants/customers_with_pending_invoices#index'
          get ":id/favorite_customer",  to: 'merchants/favorite_customer#show'
        end
      end

<<<<<<< HEAD
      resources :transactions, only: [:index, :show] do
        collection do
          get 'random',      to: 'transactions#random'
          get 'find',        to: 'transactions/search#show'
          get 'find_all',    to: 'transactions/search#index'
          get ':id/invoice', to: 'transactions/invoices#show'
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get 'random',                to: 'customers#random'
          get 'find',                  to: 'customers/search#show'
          get 'find_all',              to: 'customers/search#index'
          get ':id/invoices',          to: 'customers/invoices#index'
          get ':id/transactions',      to: 'customers/transactions#index'
          get ":id/favorite_merchant", to: 'customers/favorite_merchant#show'
        end
      end
=======
  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
>>>>>>> origin/46_single_merchant_revenue_by_date
    end
  end
end
