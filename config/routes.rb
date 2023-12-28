Rails.application.routes.draw do



  resources :agencies

  #get '/profile_path' => "pages#profile", :as => :user_root
   devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  root to: 'pages#home'
  get '/welcome', to: 'pages#welcome'
  get '/about_us', to: 'pages#about_us'
  # get '/profile', to: 'pages#profile'
 get '/terms', to: 'pages#terms'
 get '/privacy', to: 'pages#privacy'
 get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/millennium', to: 'pages#millennium'
  get '/ongoing_festivals', to: 'pages#ongoing_festivals'
  get '/new_visual', to: 'pages#new_visual'
  get '/map_venues', to: 'pages#map_venues'

resources :profiles, only: [:show, :edit, :update, :index ]

  resources :infos, only: [:new, :create, :show, :index]
# resources :notices, only: [:new, :create, :show, :index]

  resources :identities

 resources :venues, only: [:new, :create, :show, :index, :update, :edit] do
    resources :bookings, only: [:new, :create]
  end



 resources :festivals, only: [:new, :create, :show, :edit, :update, :test] do
    resources :bookings, only: [:new, :create]
  end

resources :festivals, only: :index do
  member do
      post 'toggle_favorite', to: "festivals#toggle_favorite"
      end
  end

 resources :bookings, only: [:show, :destroy, :update, :edit, :index ]

  resources :bands do
    resources :gigs, only: [:new, :create, :show]
    resources :offers, only: [:new, :create, :show]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  resources :gigs, only: [:destroy, :update, :edit]
  resources :offers, only: [:destroy, :update, :edit]


end
