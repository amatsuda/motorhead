require 'wanko/engine'

module Spanish
  class Engine < ::Rails::Engine
    include Wanko::Engine

    active_if { false }
  end
end
