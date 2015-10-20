require 'wanko/engine'

module RoutesFallback
  class Engine < ::Rails::Engine
    include Wanko::Engine

    active_if { false }
  end
end
