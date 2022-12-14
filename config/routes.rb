Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  authenticate :user, -> (user) {user.employee} do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Blazer::Engine, at: "blazer"
  end
post '/quote', to: 'quotes#create'

# TODO post for leads; DONE
post '/leads', to: 'leads#create'


root "pages#index"

get "/index", to: "pages#index"

get "/commercial", to:"pages#commercial"

get "/quoteform", to:"pages#quoteform"

get "/residential", to:"pages#residential"

end
