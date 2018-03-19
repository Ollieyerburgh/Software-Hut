Rails.application.routes.draw do


  devise_for :admins
  devise_for :users

  resources :admin
  namespace :admin do
    resources :requests
  end

<<<<<<< HEAD
  resources :activity

  #resources :activities do
  #  member do
  #    put :approve
  #  end
  #end
=======
  resources :events do
    member do
      put :approve
    end
  end
>>>>>>> 091d1a98e2723fb01ad323e32c116d968cc89b28

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all
  post "/admin-approve", to: "admin#approve", via: :all
  post "/admin-reject", to: "admin#reject", via: :all

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'


  root to: "pages#home"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
