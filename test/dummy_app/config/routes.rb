# frozen_string_literal: true
Rails.application.routes.draw do
  get 'omg' => 'omg#index'
  resource :greeting, controller: 'greeting', only: :show
end
