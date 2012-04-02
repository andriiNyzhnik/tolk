Tolk::Engine.routes.draw do
  root :to => 'locales#index'
  get :sync, :to => 'application#sync', :as => :sync
  get :reload,  :to => 'application#reload', :as => :reload

  resources :locales do
    member do
      get :all
      get :updated
    end
  end
  resource :search
end
