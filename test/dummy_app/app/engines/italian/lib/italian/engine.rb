# frozen_string_literal: true
require 'motorhead/engine'

module Italian
  class Engine < ::Rails::Engine
    include Motorhead::Engine

    active_if { false }
  end
end
