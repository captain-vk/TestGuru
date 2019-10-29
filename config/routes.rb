# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  get 'users/new'

  root 'tests#index'

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

  post :start, on: :member
end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
