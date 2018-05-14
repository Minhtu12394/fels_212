Rails.application.routes.draw do

  root "static_pages#home"
  resources :categories, only: [:index, :show]
  devise_for :users
end

