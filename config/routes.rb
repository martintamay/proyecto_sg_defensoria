Rails.application.routes.draw do
  #get 'home/index'

  root to: "legal_cases#index"
  devise_for :users

  resources :equipment_details
  resources :transfer_cases
  resources :legal_cases
  resources :criminal_records
  resources :people
  resources :shifts
  resources :lawyer_actions
  resources :hearings
  resources :shifts
  resources :lawyer_actions
  resources :hearings
  resources :judges
  resources :visits
  resources :reclusions
  resources :suspects
  resources :courts
  resources :entities
  resources :shifts
  resources :correo
  resources :users do
    member do
      get :cambiar_rol
    end
  end
 resources :cases_reports do
    collection do
       get "listar_casos"
    end
  end
  
 resources :suspects_reports do
     collection do
       get "listar_imputados"
     end
 end
 
 end
