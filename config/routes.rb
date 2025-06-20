Rails.application.routes.draw do
  devise_for :users

  resources :projects, only: [ :index ]
  root "projects#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
