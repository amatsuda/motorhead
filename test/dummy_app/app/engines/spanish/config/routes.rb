# frozen_string_literal: true
Spanish::Engine.routes.draw do
  resource :greeting, controller: 'greeting', only: :show
end
