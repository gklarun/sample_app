SampleApp::Application.routes.draw do
  resources :users do
    member do
      get :confirm_email
    end
  end
  resources :clubs
  resources :user_follows, only: [:show, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  get "clubs/delete/:id", controller: 'clubs', action: 'delete', as: "delete_club"


  root  'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"

end
