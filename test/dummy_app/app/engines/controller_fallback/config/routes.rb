# frozen_string_literal: true
ControllerFallback::Engine.routes.draw do
  resource :greeting, controller: 'greeting', only: :show
end
