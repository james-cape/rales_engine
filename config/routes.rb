Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/:id/invoices',          to: 'invoices#index'
        get '/:id/transactions',      to: 'transactions#index'
        get '/find',                  to: 'search#show'
        get '/find_all',              to: 'search#index'
        get '/:id/favorite_merchant', to: 'favorite_merchant#show'
        get '/random',                to: 'random#show'
      end

      namespace :invoice_items do
        get '/:id/item',    to: 'items#show'
        get '/:id/invoice', to: 'invoices#show'
        get '/find',        to: 'search#show'
        get '/find_all',    to: 'search#index'
        get '/random',      to: 'random#show'
      end

      namespace :invoices do
        get '/:id/transactions',  to: 'transactions#index'
        get '/:id/items',         to: 'items#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/customer',      to: 'customers#show'
        get '/:id/merchant',      to: 'merchants#show'
        get '/find',              to: 'search#show'
        get '/find_all',          to: 'search#index'
        get '/random',            to: 'random#show'
      end

      namespace :items do
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/merchant',      to: 'merchants#show'
        get '/find',              to: 'search#show'
        get '/find_all',          to: 'search#index'
        get '/:id/best_day',      to: 'best_day#show'
        get '/most_items',        to: 'most_items#index'
        get '/most_revenue',      to: 'most_revenue#index'
        get '/random',            to: 'random#show'
      end

      namespace :merchants do
        get '/:id/items',                           to: 'items#index'
        get '/:id/invoices',                        to: 'invoices#index'
        get '/most_revenue',                        to: 'most_revenue#index'
        get '/most_items',                          to: 'most_items#index'
        get '/revenue',                             to: 'revenue#show'
        get '/:id/favorite_customer',               to: 'favorite_customer#show'
        get '/:id/customers_with_pending_invoices', to: 'customers_with_pending_invoices#index'
        get '/find',                                to: 'search#show'
        get '/find_all',                            to: 'search#index'
        get '/:id/revenue',                         to: 'merchant_revenue#show'
        get '/random',                              to: 'random#show'
      end

      namespace :transactions do
        get '/:id/invoice', to: 'invoices#show'
        get '/find',        to: 'search#show'
        get '/find_all',    to: 'search#index'
        get '/random',      to: 'random#show'
      end

      resources :customers,     only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :invoices,      only: [:index, :show]
      resources :items,         only: [:index, :show]
      resources :merchants,     only: [:index, :show]
      resources :transactions,  only: [:index, :show]
    end
  end
end
