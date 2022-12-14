Rails.application.routes.draw do
  devise_for :users

  root to: 'user#index'

  # get 'inventory_food/index'
  # get 'food/index'
  # get 'recipe/index'
  # get 'recipe/show'
  # get 'recipes_food/index'
  # get 'inventory/Index'
  # get 'inventory/show'
  # get 'user/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :user do
    resources :inventory
    resources :food
    resources :recipe do
      resources :recipes_food
    end
  end

  get '/public_recipes', to: 'recipe#public'
  # shoping list
  get '/shopping_list', to: 'inventory#shopping'
end
