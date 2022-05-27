Rails.application.routes.draw do
  get 'admin', to: 'admin#index'

  controller :sessions do
    get 'login', action: :new
    post 'login', action: :create
    delete 'logout', action: :destroy
  end

  resources :users
  resources :orders
  resources :line_items
  resources :carts
  get "store/index"
  
  resources :products do
    get :who_bought, on: :member
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "store#index", as: "store"
end
