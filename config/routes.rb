Rails.application.routes.draw do


  resources :resources
  devise_for :users
  resources :events do
    member do
      put :approve
    end
  end

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all
  match "/admin-dashboard", to: "pages#admin_dashboard", via: :all
  match "/admin", to: "admin#index", via: :all
  post "/admin-approve", to: "admin#approve", via: :all

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'


  root to: "pages#home"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
