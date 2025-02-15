Rails.application.routes.draw do

  namespace :admin do
    get 'dashboards/index'
    resources :users, only: [:index, :show, :destroy]
    resources :projects, only: [:index, :create, :destroy]
  end
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }


  devise_for :users

  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :projects, only: [:index] do
    resources :post_works do
      resources :post_comments, only: [:create, :destroy]
    end
  end

  root to: "homes#top"

  get "search" => "searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
