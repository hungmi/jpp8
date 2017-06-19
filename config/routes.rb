Rails.application.routes.draw do
  root "pages#welcome"
  resources :products, only: [:index, :show]
  controller :pages do
  	get "welcome"
  end
  namespace "admin" do
  	get "dashboard", to: "dashboards#home"
  	resources :products
  	resources :categories
  end

 	if Rails.env.development?
 	  require 'sidekiq/web'
		mount Sidekiq::Web => '/sidekiq'
	end
end
