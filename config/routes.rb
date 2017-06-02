Rails.application.routes.draw do
  root "pages#welcome"
  resources :products
  get 'pages/welcome'
end
