require 'motorhead/engine'

module ViewRenderFallback
  class Engine < ::Rails::Engine
    include Motorhead::Engine

    active_if { false }
  end
end
