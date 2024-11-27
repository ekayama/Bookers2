Rails.application.routes.draw do

devise_for :users

resources :books do
  resources :book_comments, only: [:create, :destroy]
end



resources :users
root to: "home#top"
get 'home/about' => 'home#about', as: 'about'
end
