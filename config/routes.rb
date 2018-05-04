Rails.application.routes.draw do
  root "dancers#index"

  get   '/query1',    to: 'data#query1'
  post  '/query1',    to: 'data#query1_post'
  get   '/data',      to: 'data#index'

  resources :couples
  resources :dancers
  resources :entries
  resources :participants
  resources :competitions
  resources :agesections
  resources :divisions
end
