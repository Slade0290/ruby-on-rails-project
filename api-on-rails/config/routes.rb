Rails.application.routes.draw do
  resources :cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api, defaults: { format: :json} do
      resources :cars, only: [ :index , :create , :show , :destroy, :update]
  end
end

