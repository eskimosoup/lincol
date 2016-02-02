Rails.application.routes.draw do
  get 'general-downloads', as: 'general_download', to: 'application#general_downloads'

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
      get 'general_download_form'
      get 'inpage_contact'
      post 'inpage_contact'
    end
  end

  mount Optimadmin::Engine => '/admin'

  %w( 403 404 422 500 ).each do |code|
    get code, to: 'errors#show', code: code
  end

  # This has to be the last route in your list
  match "*path", to: "errors#show", via: :all, code: 404 unless Rails.application.config.consider_all_requests_local

  root to: 'application#index'
end
Optimadmin::Engine.routes.draw do
  resources :general_downloads, except: :show do
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
  resources :additional_contents, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
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
