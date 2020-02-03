Rails.application.routes.draw do
  namespace :admin do
    resource :session, only: %i[new create destroy]
    resources :uploads, only: %i[index destroy] do
      resource :approval, only: :create, module: :uploads
    end

    root to: 'uploads#index'
  end

  resources :uploads, only: :create

  root to: 'saab900#show'
end
