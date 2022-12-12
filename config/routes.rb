Rails.application.routes.draw do
  get 'inventory_food/index'
  get 'food/index'
  get 'recipe/index'
  get 'recipe/show'
  get 'recipes_food/index'
  get 'inventory/Index'
  get 'inventory/show'
  get 'user/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
