# frozen_string_literal: true
require 'motorhead/engine'

module MountAtCapricorn
  class Engine < ::Rails::Engine
    include Motorhead::Engine

    active_if { false }
    mount_at 'capricorn'
  end
end
