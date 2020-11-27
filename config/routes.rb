Rails.application.routes.draw do
  get '/', to: 'user#login'
  get '/signup', to: 'user#signup'
  get 'user/create'
  get 'user/edit'
  get 'user/show'
  get 'user/detail'
  get 'cars/create'
  get 'cars/edit'
  get '/cars', to: 'cars#show'
  get 'cars/detail'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
