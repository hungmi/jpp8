Rails.application.routes.draw do
  root "pages#welcome"
  resources :products, only: [:index, :show]
  get 'pages/welcome'
  namespace "admin" do
  	get "dashboard", to: "dashboards#home"
  	resources :products
  end
end
