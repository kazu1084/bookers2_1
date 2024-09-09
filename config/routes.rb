Rails.application.routes.draw do
  devise_for :users
  resources :books,only: [:index, :create, :show, :edit, :destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :users,only: [:index, :show, :edit, :update]
  get 'home/about' => 'homes#about',as: 'about'
end
