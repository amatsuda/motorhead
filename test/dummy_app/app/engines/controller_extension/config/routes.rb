# frozen_string_literal: true
ControllerExtension::Engine.routes.draw do
  resource :greeting, controller: 'greeting', only: :show
end
