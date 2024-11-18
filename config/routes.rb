Rails.application.routes.draw do

resources :books do
  resources :book_comments, only: [:create, :destroy]
end


devise_for :users
resources :users
root to: "homes#top"
get 'homes/about' => 'homes#about', as: 'about'
end
