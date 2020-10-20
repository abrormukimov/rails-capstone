# frozen_string_literal: true

Rails.application.routes.draw do
  resources :dealings
  get 'users/index'
  get 'users/show'
  resources :deals do
    resources :comments
  end
  resources :groups
  devise_for :users, controllers: { registrations: 'registrations' }
  delete 'remove', to: 'images#remove'
  get 'show', to: 'users#show'
  get 'group_deals', to: 'users#make_deals'
  get 'group_transactions', to: 'users#group_transactions'
  get 'external', to: 'users#external'
  root 'deals#new'
end
