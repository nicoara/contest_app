Rails.application.routes.draw do
  root "dancers#index"

  resources :dancer_partners, only: [:new, :create, :show]

  get   '/query3',    to: 'data#query3'
  get   '/query2',    to: 'data#query2'
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
