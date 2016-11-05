# frozen_string_literal: true
require 'motorhead/engine'

module RoadCrew
  class Engine < ::Rails::Engine
    include Motorhead::Engine

    active_if { true }
    mount_at 'motorhead/road_crew'

    Motorhead::Engine::ClassMethods.class_eval do
      remove_possible_method :active?
      # overwrite active? to check cookie value as well
      def active?(controller)
        if (settings = controller.send(:cookies)['road_crew_engine_settings'])
          return false if JSON.parse(settings)[controller.class.parent.name] == '0'
        end
        controller.instance_eval(&@active_if)
      end
    end
  end
end
