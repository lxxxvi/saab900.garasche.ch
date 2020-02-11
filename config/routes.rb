Rails.application.routes.draw do
  namespace :admin do
    resource :session, only: %i[new create destroy]
    resources :uploads, only: :index do
      resource :approval, only: :create, module: :uploads
      resource :deletion, only: :create, module: :uploads
    end

    root to: 'uploads#index'
  end

  resources :uploads, only: %i[new create]

  root to: 'saab900#show'
end
