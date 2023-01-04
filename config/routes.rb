Rails.application.routes.draw do
  namespace :admin do
    resource :session, only: %i[new create destroy]
    resources :uploads, only: %i[index edit update destroy]
    root to: "uploads#index"
  end

  resources :uploads, only: %i[new create]

  root to: "saab900#show"
end
