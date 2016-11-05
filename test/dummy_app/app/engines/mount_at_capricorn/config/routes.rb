# frozen_string_literal: true
MountAtCapricorn::Engine.routes.draw do
  get 'top' => 'top#show'
end
