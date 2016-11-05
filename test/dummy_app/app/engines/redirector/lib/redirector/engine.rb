# frozen_string_literal: true
require 'motorhead/engine'

module Redirector
  class Engine < ::Rails::Engine
    include Motorhead::Engine

    active_if { false }
  end
end
