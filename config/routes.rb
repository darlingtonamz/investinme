Rails.application.routes.draw do
  resources :categories
  resources :users do
    resources :campaigns do
      resources :payments
    end
  end
end
