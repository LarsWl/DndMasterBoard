# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: 'campaigns#index'

  resources :campaigns
  resources :chapters, except: %i[index]
  resources :acts, except: %i[index]
  resources :master_characters, except: %i[index]
  resources :main_characteristics, only: %i[update]
  resources :enemies, except: %i[index]
  resources :combat_skills, except: %i[show index]
end
