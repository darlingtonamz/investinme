Rails.application.routes.draw do
  root 'home#index'

  resources :categories
  resources :users do
    member do
      resources :campaigns do
        resources :payments
      end
    end
  end
end
