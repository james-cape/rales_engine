Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      # Customer Relationships
      get '/customers/:id/invoices',     to: 'customers/invoices#index'
      get '/customers/:id/transactions', to: 'customers/transactions#index'
      get '/customers/find', to: 'customers/search#show'
      get '/customers/find_all', to: 'customers/search#index'

      # Invoice_item Relationships
      get '/invoice_items/:id/item',    to: 'invoice_items/items#show'
      get '/invoice_items/:id/invoice', to: 'invoice_items/invoices#show'

      # Invoice Relationships
      get '/invoices/:id/transactions',  to: 'invoices/transactions#index'
      get '/invoices/:id/items',         to: 'invoices/items#index'
      get '/invoices/:id/invoice_items', to: 'invoices/invoice_items#index'
      get '/invoices/:id/customer',      to: 'invoices/customers#show'
      get '/invoices/:id/merchant',      to: 'invoices/merchants#show'

      # Item Relationships
      get '/items/:id/invoice_items', to: 'items/invoice_items#index'
      get '/items/:id/merchant',      to: 'items/merchants#show'

      # Merchant Relationships
      get '/merchants/:id/items',             to: 'merchants/items#index'
      get '/merchants/:id/invoices',          to: 'merchants/invoices#index'
      get '/merchants/most_revenue',          to: 'merchants/most_revenue#index'
      get '/merchants/most_items',            to: 'merchants/most_items#index'
      get '/merchants/revenue',               to: 'merchants/revenue#show'
      get '/merchants/:id/favorite_customer', to: 'merchants/favorite_customer#show'
      get '/merchants/:id/customers_with_pending_invoices', to: 'merchants/customers_with_pending_invoices#index'

      # Transaction Relationships
      get '/transactions/:id/invoice',    to: 'transactions/invoices#show'


      resources :customers,     only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :invoices,      only: [:index, :show]
      resources :items,         only: [:index, :show]
      resources :merchants,     only: [:index, :show]
      resources :transactions,  only: [:index, :show]
    end
  end
end
