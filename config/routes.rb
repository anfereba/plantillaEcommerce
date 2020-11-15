Rails.application.routes.draw do
  get 'cards/show'
  devise_for :users
  resources :categories
  resources :order_items
  resource :cards, only:[:show]
  get '/bienvenida', to: 'home#index'
  get '/nosotros', to: 'home#about_us'
  root to: "home#index"

  get 'productos', to: "productos#index"
  get 'productos/new', to: "productos#new", as: :new_productos
  get 'productos/:id/edit', to: "productos#edit", as: :edit_producto
  get 'productos/:id', to: "productos#show"

  patch "/productos/:id", to: "productos#update", as: :producto
  post "productos", to: "productos#create"
  delete "/productos/:id", to:"productos#destroy"
end
