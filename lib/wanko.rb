require "wanko/version"

module Wanko
  module Controller; end

  class Railtie < ::Rails::Railtie
    ActiveSupport.on_load :action_controller do
      require 'wanko/abstract_controller'
    end
    ActiveSupport.on_load :action_view do
      require 'wanko/action_view'
    end
  end
end
