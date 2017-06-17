Rails.application.routes.draw do

  namespace :backoffice do
    get 'cids/index'
  end

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :hospitals, except: [:show, :destroy] 
    resources :admins, except: [:show]
    resources :doctors, except: [:show]
    resources :patients, except: [:show]
    get 'dashboard', to: 'dashboard#index' 
    #get 'patients/index' get 'doctors/index'
  end

  namespace :site do
    get 'home/index'
  end

  devise_for :admins, :skip =>[:registrations]
  devise_for :pacientes

  root 'site/home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
