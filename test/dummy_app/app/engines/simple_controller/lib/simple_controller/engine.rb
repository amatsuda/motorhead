
module SimpleController
  class Engine < ::Rails::Engine
    include Motorhead::Engine

    active_if { true }
  end
end
