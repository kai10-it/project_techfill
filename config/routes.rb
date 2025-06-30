Rails.application.routes.draw do
  get "/" => "home#top"

  # サインアップのルート
  get "users/signup" => "users#new"
  # ユーザー情報を登録するルート
  post "users/create" => "users#create"
  # ユーザー情報のルート
  get "users/:id/edit" => "users#edit"
  # ユーザー情報の更新をするルート
  post "users/:id/update" => "users#update"
  # ログインページのルート
  get "users/check" => "users#check"
  # ログインを確認するルート
  post "users/login" => "users#login"
  # ログアウトするルート
  post "users/logout" => "users#logout"


  # 記事作成ページのルート
  get "articles/new" => "articles#new"
  # 記事作成をするルート
  post "articles/create" => "articles#create"
  # 記事詳細ページのルート
  get "articles/:id/show" => "articles#show"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # 記事に対してのコメントのルートを設定  
  resources :articles do
    resources :comments, only: [:create]
  end
end
