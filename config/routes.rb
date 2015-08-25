Rails.application.routes.draw do
  mount Optimadmin::Engine => "/admin"
  root to: "application#index"
end
Optimadmin::Engine.routes.draw do
end
