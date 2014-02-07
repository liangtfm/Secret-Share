SecretShareAjax::Application.routes.draw do
  resources :users, :only => [:create, :new, :show, :index] do
    resources :secrets, only: [:new]
    resources :friendships, only: [:create]
    delete "/friendships", action: "destroy", controller: "friendships"
  end

  resources :tags, only: [:create]

  resources :secrets, except: [:new]

  resource :session, :only => [:create, :destroy, :new]

  root :to => "users#show"

end
