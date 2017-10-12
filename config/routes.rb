Rails.application.routes.draw do
  devise_for :users
  	root to: "judges#index"

  resources :judges
  resources :assistants
  resources :suspects
  resources :lawyers
  resources :courts
  resources :entities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
