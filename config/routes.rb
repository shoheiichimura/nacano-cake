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


  root to: 'homes#top'
  get 'about'=>"homes#about",as: "about"


  namespace :admin do
    root to: 'homes#top'
    resources :orders
    resources :order_details
    resources :genres
    resources :items
    resources :customers
  end

  namespace :public do
    resources :items
    post '/orders/comfirm' => "orders#comfirm", as: 'comfirm'
    get '/orders/complete'  =>  'orders#complete', as: 'complete'
    resources :orders, only: [:new, :create, :index, :show, :edit, :destroy, :update]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: "destroy_all"
    resources :cart_items
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    get 'customers/confirm' => "customers#confirm", as: 'confirm'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    patch 'customers/information' => 'customers#update', as: 'information'
    resources :shipping_addresses
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
