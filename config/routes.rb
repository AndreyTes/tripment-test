Rails.application.routes.draw do
  root 'procedures#new'
  resources :procedures
end
