Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customer,     only: [:show]
      resources :invoice,      only: [:show]
      resources :invoice_item, only: [:show]
      resources :item,         only: [:show]
      resources :merchant,     only: [:show]
      resources :transaction,  only: [:show]
    end
  end
end
