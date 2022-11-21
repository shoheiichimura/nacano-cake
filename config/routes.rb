Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  # 管理者用
  # URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    resources :genres
  end

  root to: 'homes#top'
  get 'about'=>"homes#about",as: "about"

  namespace :admin do
    resources :items
  end

  namespace :public do
    resources :items
  end

  namespace :public do
    get "orders/complete" => "orders#complete", as: "complete"
    resources :orders, only:[:index,:create,:new,:edit,:show,:update,:destroy]

  end

   namespace :public do
    resources :shipping_addresses
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
