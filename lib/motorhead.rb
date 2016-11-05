# frozen_string_literal: true
require "motorhead/version"
require 'motorhead/config'

module Motorhead
  class Railtie < ::Rails::Railtie
    ActiveSupport.on_load :action_controller do
      require 'motorhead/abstract_controller'
    end
    ActiveSupport.on_load :action_view do
      require 'motorhead/action_view'
    end
  end
end
