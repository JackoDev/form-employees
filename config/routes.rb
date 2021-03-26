Rails.application.routes.draw do
  root to: 'employees#index'
  resources :employees do
    collection { post :import }
  end
end
