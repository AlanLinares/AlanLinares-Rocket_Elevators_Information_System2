Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root "pages#index"
get "index", to: "pages#index"

# ch ROUTES
get "commercial", to:"pages#commercial"
get "quoteform", to:"pages#quoteform"
get "residential", to:"pages#residential"


end
