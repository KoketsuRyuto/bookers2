Rails.application.routes.draw do
  get 'home/about' => 'homes#about',as:'about'
  devise_for :users
  
  resources :books, only:[:index,:create,:show,:destroy,:edit,:update]
  resources :users, only:[:index,:show,:edit,:update]
  
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
