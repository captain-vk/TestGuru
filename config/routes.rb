# frozen_string_literal: true

Rails.application.routes.draw do

  get 'users/new'

  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'


  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
