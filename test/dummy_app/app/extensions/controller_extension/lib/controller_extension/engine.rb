require 'motorhead/engine'

module ControllerExtension
  class Engine < ::Rails::Engine
    include Motorhead::Engine

    active_if { false }
  end
end
