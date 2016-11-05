# frozen_string_literal: true
SimpleController::Engine.routes.draw do
  resources :posts, only: :index
end
