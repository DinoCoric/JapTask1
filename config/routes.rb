Rails.application.routes.draw do
  devise_for :users
  root "recipe_categories#index"
  get  '/recipe_categories', to: 'recipe_categories#index'
  get '/recipes', to: 'recipes#index', as: 'recipes'
  get '/recipes/:recipe_category_id(/search/:search)', to: 'recipes#index', as: 'recipes_index'
  get '/recipes/preview/:id', to: 'recipes#show', as: 'show_recipes'
  get '/recipes/new/:recipe_category_id', to: 'recipes#new', as: 'recipes_new'
  post '/recipes/create/:recipe_category_id', to: 'recipes#create', as: 'create_recipes_form'

end
