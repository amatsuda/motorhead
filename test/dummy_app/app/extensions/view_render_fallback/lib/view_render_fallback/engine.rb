require 'wanko/engine'

module ViewRenderFallback
  class Engine < ::Rails::Engine
    include Wanko::Engine

    active_if { false }
  end
end
