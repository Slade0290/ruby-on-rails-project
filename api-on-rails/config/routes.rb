Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'application#home'

  # root to: "cars#index"

  resources :cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api, defaults: { format: :json} do
      resources :cars, only: [ :index , :create , :show , :destroy, :update]
  end

  # get 'swagger' , to: 'swagger/cars#show'


end