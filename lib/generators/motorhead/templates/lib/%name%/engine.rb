require 'motorhead/engine'

module <%= camelized %>
  class Engine < ::Rails::Engine
    include Motorhead::Engine

    active_if { true }
  end
end
