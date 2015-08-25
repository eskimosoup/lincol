Rails.application.routes.draw do
  resources :contacts, only: [:new, :create]

  mount Optimadmin::Engine => '/admin'
  root to: 'application#index'
end
Optimadmin::Engine.routes.draw do
  resources :industries, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
end
