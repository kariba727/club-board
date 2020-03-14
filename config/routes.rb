Rails.application.routes.draw do
devise_for :users

  root 'tops#index'

  resources :users, only: [:index, :show, :destroy]
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
post "posts/:id/destroy" => "posts#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
