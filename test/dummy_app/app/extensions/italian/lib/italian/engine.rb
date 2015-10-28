require 'wanko/engine'

module Italian
  class Engine < ::Rails::Engine
    include Wanko::Engine

    active_if { false }
  end
end
