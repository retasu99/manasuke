Rails.application.routes.draw do

  namespace :admin do #-----------------------------------------------以下 管理者用コントローラ・アクションの記述------------------------
    get 'dashboards/index'                                              #管理者トップページ（ダッシュボード）
    post '/dashboards/admin_guest_in', to: 'dashboards#admin_guest'     #管理者ゲストログイン
    resources :users, only: [:index, :show, :destroy]                   #管理者用ユーザー一覧、詳細、退会
    resources :projects, only: [:index, :create, :destroy]              #管理者用プロジェクト一覧、作成、削除
  end
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'                                          #管理者ログイン
  } #-----------------------------------------------------------------ここまで管理者用--------------------------------------------


  scope module: :public do #-----------------------------------------------以下 エンドユーザー用コントローラ・アクションの記述------------------------

    root to: "homes#top"                                                     #トップページ
    devise_for :users                                                        #ログイン、ログアウト、新規登録
    post '/homes/guest_sign_in', to: 'homes#new_guest'                       #ゲストログイン
    resources :users, only: [:index, :show, :edit, :update, :destroy] do     #エンドユーザー一覧、詳細、編集、退会
      resource :relationship, only: [:create, :destroy]                      #フォロー機能
      member do
        get :acknowledged_users                                              #承認（いいね）したユーザーデータを取り出すため
        get :following_users                                                 #自分がフォローしているユーザーデータを取り出すため
        get :followers                                                       #自分をフォローしているユーザーデータを取り出すため
      end
    end
    resources :projects, only: [:index] do                                   #プロジェクト一覧
      resources :post_works do                                               #投稿機能
        resources :post_comments, only: [:create, :destroy]                  #投稿へのコメント機能
        resource :acknowledgement, only: [:create, :destroy]                 #投稿への承認機能（いいね機能）
      end
    end
    get "search" => "searches#search"                                        #検索機能
    resources :notifications, only: [:index, :destroy]                       #通知機能
    
  end #--------------------------------------------------------------------ここまでエンドユーザー用--------------------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
