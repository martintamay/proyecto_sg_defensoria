Rails.application.routes.draw do
  #get 'home/index'

  root to: "home#index"

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
  devise_for :users
  resources :judges
  resources :visits
  resources :reclusions
  resources :suspects
  resources :courts
  resources :entities
  resources :shifts
  resources :users
  resources :correo
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
