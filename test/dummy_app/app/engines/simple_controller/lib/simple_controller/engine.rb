
# frozen_string_literal: true
module SimpleController
  class Engine < ::Rails::Engine
    include Motorhead::Engine

    active_if { true }
  end
end
