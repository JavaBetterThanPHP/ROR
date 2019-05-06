Rails.application.routes.draw do
  resources :tags
  resources :types
  namespace :api do
    namespace :v1 do
      resources :users
      resources :types
      resources :tags
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
