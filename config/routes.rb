# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :managers
  default_url_options host: ENV['DOMAIN']

  root 'home#index'

  resources :issues do
    post :send_issue, on: :member
  end
  resources :links, except: %i[show]
  resources :managers, except: %i[show]
  resources :subscribers, except: %i[show edit destroy] do
    get :manage, on: :collection
  end
end
