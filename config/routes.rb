Rails.application.routes.draw do
  #get 'home/index'

  root to: "legal_cases#index"
  devise_for :users

  resources :equipment_details
  resources :transfer_cases
  # resources :legal_cases
  resources :legal_cases do
    collection do
      get "reporte"
    end
  end
  # get "legal_cases/reporte", to: 'legal_cases#reporte'
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
  resources :suspects do
    collection do
      get "reporte"
    end
  end
  resources :courts
  resources :entities
  resources :shifts
  resources :correo
  resources :users do
    member do
      get :cambiar_rol
      get :auditoria_usuario
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


 resources :visits_records do
     collection do
       get "listar_visitas"
     end
 end

 resources :shifts_reports do
     collection do
       get "listar_turnos"
     end
 end

 resources :users_reports do
     collection do
       get "listar_defensores"
     end
 end

 resources :transfer_cases_reports do
     collection do
       get "listar_transferencias"
     end
 end

 end
