Rails.application.routes.draw do

  get 'admin_dashboard/index'
  get "/admin/dashboard", to: "admin_dashboard#index", as: :admin_dashboard

  root "items#index"

  resources :items
post "items/:id/claim", to: "items#claim", as: "claim_item"

  get "/admin/login", to: "admin_sessions#new", as: :admin_login
  post "/admin/login", to: "admin_sessions#create"
  delete "/admin/logout", to: "admin_sessions#destroy", as: :admin_logout

end