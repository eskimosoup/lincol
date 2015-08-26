Rails.application.routes.draw do
  resources :contacts, only: [:new, :create] do
    collection do
      get 'sidebar_form'
      get 'footer_form'
    end
  end

  mount Optimadmin::Engine => '/admin'
  root to: 'application#index'
end
Optimadmin::Engine.routes.draw do
  resources :industry_banners, except: [:show] do
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
