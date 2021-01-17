# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'campaigns#index'

  resources :campaigns
  resources :npcs
  resources :chapters
  resources :acts
  resources :master_characters
end
