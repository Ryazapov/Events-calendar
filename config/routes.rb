Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"

  resources :users, only: [] do
    resources :events, controller: "user_events", only: :index
  end

  resources :events, controller: "events"
end
