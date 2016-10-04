Rails.application.routes.draw do
  get '/api/v1/items/random', to: 'api/v1/items#random'
  get '/api/v1/invoices/random', to: 'api/v1/invoices#random'

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
