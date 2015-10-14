require 'wanko/engine'

module ControllerFallback
  class Engine < ::Rails::Engine
    include Wanko::Engine

    active_if { false }
  end
end
