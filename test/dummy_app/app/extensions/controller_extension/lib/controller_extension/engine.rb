require 'wanko/engine'

module ControllerExtension
  class Engine < ::Rails::Engine
    include Wanko::Engine

    active_if { false }
  end
end
