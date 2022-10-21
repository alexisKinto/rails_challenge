Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products, except: :show
  resources :brands, except: :show

  # Defines the root path route ("/")
  root 'brands#index'
end
