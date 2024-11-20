Rails.application.routes.draw do

devise_for :users

resources :books do
  resources :book_comments, only: [:create, :destroy]
end



resources :users
root to: "homes#top"
get 'homes/about' => 'homes#about', as: 'about'
end
