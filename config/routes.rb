Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "ping#index"
  get "/ping", to: "ping#index"


  namespace :x, constraints: { format: 'json' } do
    namespace :api do
      namespace :v1 do
        get "categories", to: "data#categories"
        get "categories/:category_id/positions", to: "data#positions_by_category"
        get "positions", to: "data#positions"
      end
    end
  end
end