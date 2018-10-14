Rails.application.routes.draw do
  get :test_connection, controller: :application

  get :search, controller: :searches
end
