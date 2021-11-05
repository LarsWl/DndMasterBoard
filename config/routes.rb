# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :users do
    get '/profile/:nickname', to: 'users/users#profile', as: :user
  end

  root to: 'home#index'

  resources :campaigns
  resources :chapters, except: %i[index]
  resources :acts, except: %i[index]
  resources :master_characters, except: %i[index]
  resources :main_characteristics, only: %i[update]
  resources :enemies, except: %i[index]
  resources :combat_skills, except: %i[show index]
  resources :player_characters
  resources :campaign_invitations, only: %i[create] do
    post '/accept', action: 'accept', on: :member, as: :accept
    post '/decline', action: 'decline', on: :member, as: :decline
  end

  resources :friends, only: %i[index create] do
    get '/suggestions', action: 'suggestions', on: :collection
    delete '/decline_request', action: 'decline_request', on: :member, as: :decline_request
    patch '/accept_request', action: 'accept_request', on: :member, as: :accept_request
  end

  namespace :editor do
    get '/', to: 'editor#index'
    resources :master_characters
  end
end
