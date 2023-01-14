Rails.application.routes.draw do
  
  #ユーザー用.
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  #店舗用.
  devise_for :stores, skip: [:passwords], controllers: {
  registrations: "business/registrations",
  sessions: 'business/sessions'
  }
  
  #管理者用.
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
  
  #ゲストログイン用.
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  #ユーザー用.
  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"
    get "/users/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
    patch "/users/invalid" => "users#invalid", as: "invalid"
    get "/photos/favorites" => "photos#favorite", as: "favorite"
    resources :animes
    resources :scenes
    resources :users
    resources :photos do
      resources :photo_comments, only: [:create]
    end
    resources :stores
  end
  
  #店舗用.
  namespace :business do
    resources :stores
  end
  
  #管理者用.
  namespace :admin do
    root to: "homes#top"
    resources :animes
    resources :scenes
    resources :photos
    resources :users
    resources :stores
  end
  
end
