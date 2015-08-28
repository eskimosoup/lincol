Rails.application.routes.draw do

  resources :team_members, only: :index, path: 'team-members'
  resources :frequently_asked_questions, only: :index, path: 'frequently-asked-questions'
  resources :pages, only: :show
  resources :product_ranges, only: [:index, :show], path: 'product-range' do
    collection do
      get 'technical-specification-downloads', as: 'specification_download'
    end
    resources :products, only: :show
  end

  resources :contacts, only: [:new, :create] do
    collection do
      get 'sidebar_form'
      get 'footer_form'
      get 'callback_form'
      get 'download_form'
      post 'inpage_contact'
    end
  end

  mount Optimadmin::Engine => '/admin'
  root to: 'application#index'
end
Optimadmin::Engine.routes.draw do
  resources :additional_contents, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  get 'frequently_asked_questions/index'

  get 'team_members/index'

  get 'products/show'

  get 'product_ranges/show'

  resources :frequently_asked_questions, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end


  resources :pages, except: :show do
    collection do
      post 'order'
    end
    member do
      get 'edit_images'
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :team_members, except: [:show] do
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
  resources :team_members, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :products, except: [:show] do
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
  resources :product_ranges, except: [:show] do
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
