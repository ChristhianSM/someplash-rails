Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "categories#index"
  resources :categories
  resources :photos
  resources :comments
  get "/page_search", to: "photos#page_search"
end
