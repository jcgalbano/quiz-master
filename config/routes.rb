# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'courses#index'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :courses
  resources :quizzes
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
