Rails.application.routes.draw do
  resources :categories
  resources :payments
  resources :campaigns
  resources :users
end
