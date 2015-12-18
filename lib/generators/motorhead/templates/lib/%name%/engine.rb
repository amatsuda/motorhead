require 'motorhead/engine'

module <%= camelized %>
  class Engine < ::Rails::Engine
    include Motorhead::Engine

    active_if { raise <<-MSG }
Please configure appropriate access control for <%= camelized %> Engine.

e.g.
1) accessible for the admin users only:
    active_if { current_user.admin? }

2) always enabled for everyone:
    active_if { true }
MSG
  end
end
