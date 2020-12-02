Rails.application.routes.draw do
  get '/', to: 'user#login'
  get '/signup', to: 'user#signup'
  get 'user/create'
  # get 'user/edit/:id'
  # get 'user/index/:id'
  get '/user/:id', to: 'user#show'
  get '/user/:id/edit', to: 'user#edit'
  # get 'user/detail/:id'
  get 'cars/create'
  get 'cars/search'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/cars/:id/edit', to: 'cars#edit'

  get '/car/next' , to: 'paginates#next'

  get '/car/prev' , to: 'paginates#prev'

  #get '/http://localhost:3000/api/cars?page=2'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
