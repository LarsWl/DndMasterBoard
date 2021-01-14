Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'campaigns#index'

  resources :campaigns

  resources :npcs

  resources :chapters do
    resources :acts
  end
end
