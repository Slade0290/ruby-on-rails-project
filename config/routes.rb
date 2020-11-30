Rails.application.routes.draw do

 

  root 'application#home'

  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'

  }


  # root to: "cars#index"

#  resources :cars do
#    resources :cars_details
#  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api, defaults: { format: :json} do
    #  devise_for :users, controllers: {
    #    sessions: 'users/sessions'
     # }

     resources :sessions
     resources :registrations
      resources :cars, only: [ :index , :create , :show , :destroy, :update] do
        resources :cars_details
      end
      
  end

  # get 'swagger' , to: 'swagger/cars#show'


end