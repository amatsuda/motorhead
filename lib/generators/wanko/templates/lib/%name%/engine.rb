require 'wanko/engine'

module <%= camelized %>
  class Engine < ::Rails::Engine
    include Wanko::Engine

    active_if { true }
  end
end
