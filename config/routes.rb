Tolk::Engine.routes.draw do
  root :to => 'locales#index'
  get :sync, :to => 'application#sync', :as => :sync
  get :dump,  :to => 'application#dump', :as => :dump

  resources :locales do
    member do
      get :all
      get :updated
    end
  end
  resource :search
end
