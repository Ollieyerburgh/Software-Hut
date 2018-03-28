Rails.application.routes.draw do

  #resources :addresses

  devise_for :admins
  devise_for :users

  resources :admin
  namespace :admin do
    resources :requests
  end

  namespace :admin do
    resources :users
  end
  resources :resources

  resources :activities do
    member do
      put :approve
    end
  end


  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get '/search', to: 'searches#show'
  post '/search', to: 'searches#show'
  post '/admin/requests/:id/edit', to: "admin/requests#edit"


  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'


  root to: "pages#home"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
