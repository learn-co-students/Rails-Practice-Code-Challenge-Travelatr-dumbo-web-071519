Rails.application.routes.draw do
  get 'destinations/index'

  get 'destinations/edit'

  get 'destinations/new'

  get 'destinations/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :posts
  resources :destinations
end
