require 'motorhead/engine'

module ControllerFallback
  class Engine < ::Rails::Engine
    include Motorhead::Engine

    active_if { false }
  end
end
