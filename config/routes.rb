Rails.application.routes.draw do
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
    end
  end
end
