Rails.application.routes.draw do
  resources :procedures
  root 'procedures#index'
  get 'results', to: 'results#index', as: 'results'
end
