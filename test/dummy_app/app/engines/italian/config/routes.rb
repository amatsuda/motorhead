# frozen_string_literal: true
Italian::Engine.routes.draw do
  resource :greeting, controller: 'greeting', only: :show
end
