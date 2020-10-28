Rails.application.routes.draw do
  resources :categories
  get '/bienvenida', to: 'home#index'

  root to: "home#index"

  get 'productos', to: "productos#index"
  get 'productos/new', to: "productos#new", as: :new_productos
  get 'productos/:id/edit', to: "productos#edit"
  get 'productos/:id', to: "productos#show"

  patch "/productos/:id", to: "productos#update", as: :producto
  post "productos", to: "productos#create"
  delete "/productos/:id", to:"productos#destroy"
end
