Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "devise/custom/registrations" }
  
  ActiveAdmin.routes(self)
  
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  root 'home#index'
  
  get 'users/index'
  get 'home/index'
  
  #versions
  post "versions/:id/revert" => "versions#revert", :as => "revert_version"
  
  #properties
  get 'properties/update_regions', as: 'update_regions'
  get 'properties/update_places', as: 'update_places'
  get 'properties/update_map', as: 'update_map'
  
  #registrations
  patch 'users/update_avatar', as: 'update_avatar'
  
  resources :users do 
    
    
    collection do
      get :properties  # add this line
    end
    
  end
  
  resources :properties do 
    
    resources :property_assets
    
    member do
      post :update_general
      post :update_promo_image
      post :update_location
  
    end

  end

end
