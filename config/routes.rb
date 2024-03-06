Rails.application.routes.draw do
 
devise_for :admins, controllers: {
  sessions: 'admin/sessions',
  registrations: 'admin/registrations',
  confirmations: 'admin/confirmations',
  passwords: 'admin/passwords',
  mailer: 'admin/mailer',
  shared: 'admin/shared',
  unlocks: 'admin/unlocks'
}

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
   root to: "home#index"
   authenticated :admin_user do
      root to: "admin#index", as: :admin_root
    end


end


Rails.application.routes.draw do
  get "admin" => 'admin#index'
  get "index" => 'pages#index'
  get "about" => 'pages#about'
  get "contact" => 'pages#contact'
  get "service" => 'pages#service'
  get 'home/index'
  get 'user' => "user#index"
   end