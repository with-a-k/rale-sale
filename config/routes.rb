Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers,        only: [:index, :show] do
        get :transactions
        get :invoices
        get :favorite_merchant

        collection do
          get :find
          get :find_all
          get :random
        end
      end 
      
      resources :invoices,         only: [:index, :show] do
        get :transactions
        get :invoice_items
        get :items
        get :customer
        get :merchant

        collection do
          get :find
          get :find_all
          get :random
        end
      end 

      resources :invoice_items,    only: [:index, :show] do
        get :invoice
        get :item

        collection do
          get :find
          get :find_all
          get :random
        end
      end 

      resources :items,            only: [:index, :show] do
        get :invoice_items
        get :merchant
        get :best_day

        collection do
          get :find
          get :find_all
          get :random
          get :most_revenue
          get :most_items
        end
      end 

      resources :merchants,        only: [:index, :show] do
        get :invoices
        get :items
        get :favorite_customer
        get :revenue
        get :customers_with_pending_invoices

        collection do
          get :find
          get :find_all
          get :random
          get :most_revenue
          get :most_items
          get :revenue, to: 'merchants#all_revenue'
        end
      end 

      resources :transactions,     only: [:index, :show] do
        get :invoice

        collection do
          get :find
          get :find_all
          get :random
        end
      end 
    end
  end
end
