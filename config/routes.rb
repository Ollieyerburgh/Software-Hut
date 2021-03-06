Rails.application.routes.draw do

  resources :subjects
  resources :themes
  resources :deliveries
  resources :preferences
  resources :ages


  devise_for :admins
  devise_for :users


  resources :admin
  namespace :admin do
    resources :requests do
      member do
        post :approve
        get :reject
        post :reject
      end
    end
  end

  namespace :admin do
    resources :users
    resources :registrations
    resources :preferences
  end


  resources :resources

  resources :activities do
    member do
      put :approve
      put 'like' => 'activities#vote'
    end
  end

  namespace :users do
    resources :dash
  end




  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get '/help', to: 'pages#help'
  get '/analytics', to: 'pages#analytics'
  get '/search', to: 'searches#show'
  post '/search', to: 'searches#show'
  post '/admin/requests/:id/edit', to: "admin/requests#edit"


  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'


  root to: "pages#home"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
