Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  api_guard_routes for: 'users'
  resources :status, :only => [:index]
  namespace :api do
    namespace :v1 do
      resources :users
      resources :types
      resources :tags
      resources :posts
      resources :comments
      resources :bookmark_posts
      resources :favorite_posts
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
