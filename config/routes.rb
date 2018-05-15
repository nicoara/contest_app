Rails.application.routes.draw do
  root "dancers#index"

  resources :dancer_partners, only: [:new, :create, :show]

  get   '/data',      to: 'data#index'
  get   '/couples_diff_countries',    to: 'data#couples_diff_countries'
  get   '/dancers_in_one_couple',    to: 'data#dancers_in_one_couple'
  get   '/dancer_with_most_competitions', to: 'data#dancer_with_most_competitions'

  resources :couples
  resources :dancers
  resources :entries
  resources :participants
  resources :competitions
  resources :agesections
  resources :divisions
end
