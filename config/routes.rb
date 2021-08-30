Rails.application.routes.draw do
  resources :procedures
  root 'procedures#index'
end
