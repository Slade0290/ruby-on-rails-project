Rails.application.routes.draw do


  root 'application#home'

  devise_for :users
  # root to: "cars#index"

  resources :cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api, defaults: { format: :json} do
      resources :cars, only: [ :index , :create , :show , :destroy, :update]
  end

  # get 'swagger' , to: 'swagger/cars#show'

end

# SwaggerDocsSample::Application.routes.draw do

#   namespace :api  do
#   # match '/properties/:id', to: 'properties#show', via: 'get'
#   match '/cars', to: 'cars#create', via: 'post'
#   # match '/group/:id/members', to: 'groups#index', via: 'get'
#   end
  
# end

