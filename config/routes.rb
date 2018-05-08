Rails.application.routes.draw do
  use_doorkeeper
  resources :facilities
  resources :inspections
  resources :violations
end
