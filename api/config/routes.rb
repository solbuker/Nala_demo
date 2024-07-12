# frozen_string_literal: true

# api/config/routes
Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :employees do
        resources :vacations
      end
    end
  end
end
