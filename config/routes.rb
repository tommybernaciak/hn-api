Rails.application.routes.draw do
  get :test_connection, controller: :application
  resources :search_results, only: [:index, :create, :destroy] do
    get :search, on: :collection
  end
  resources :search_note_books, only: [:index, :create, :destroy]
end
