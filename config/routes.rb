Rails.application.routes.draw do

  devise_for :users

  # get 'users/show'
  # get 'users/edit'
  resources :users, only: [:index, :show, :edit, :update]

  # get 'projects/index'
  resources :projects, only: [:index] do
    resources :post_works
  end

  # get 'homes/top'
  root to: "homes#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
