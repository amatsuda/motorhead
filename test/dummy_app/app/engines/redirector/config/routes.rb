# frozen_string_literal: true
Redirector::Engine.routes.draw do
  get 'greeting2' => 'greeting#show'
end
