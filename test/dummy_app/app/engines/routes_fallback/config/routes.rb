# frozen_string_literal: true
RoutesFallback::Engine.routes.draw do
  resource :greeting, controller: 'greeting', only: :show
end
