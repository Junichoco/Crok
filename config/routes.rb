Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  resources :users, only: [:show]

  resources :dogs do
    resources :health_tracks, only: [:new, :create, :update, :destroy]
    resources :medical_records, only: [:new, :create, :update, :destroy]
  end

  resources :tasks, only: [:create, :update]
  resources :families, only: [:show, :create, :update]

  get 'welcome', to: 'dogs#welcome', as: :welcome
  # get 'my_family', to: 'families#show', as: :family
  get 'dogs/:id/health', to: 'dogs#health', as: :dog_health
end
