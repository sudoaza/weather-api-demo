Rails.application.routes.draw do
  root 'pages#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'cities/search'
      get 'cities/:id', to: 'cities#current'
      get 'weather/coordinates', to: 'weather#coordinates'
    end
  end
end
