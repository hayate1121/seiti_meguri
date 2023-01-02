Rails.application.routes.draw do
  
  #ユーザー用
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  #店舗用
  devise_for :stores, skip: [:passwords], controllers: {
  registrations: "business/registrations",
  sessions: 'business/sessions'
  }
  
  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
  
  #ユーザー用
  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"
  end
  
  #店舗用
  namespace :business do
  end
  
  #管理者用
  namespace :admin do
  end
  
end
