Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
# root 'home#index'
devise_for :users
root 'home#index'
  	resources :transfers
	resources :stocks do
  	resources :orders
  	resources :transfers
  end
end
