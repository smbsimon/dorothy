Rails.application.routes.draw do

  root 'dashboard#index'
  get  'dashboard/index'
  resources :books, only: [:index]
  
end
