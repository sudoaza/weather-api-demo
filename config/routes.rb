Rails.application.routes.draw do
  root 'pages#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'cities/search'
      get 'cities/:id', to: 'cities#current'
    end
  end
end
