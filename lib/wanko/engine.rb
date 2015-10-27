module Wanko
  module Engine
    extend ActiveSupport::Concern

    module ClassMethods
      attr_accessor :on_error

      def active_if(&block)
        @active_if = block
      end

      def active?(controller)
        controller.instance_eval(&@active_if)
      end
    end

    included do
      isolate_namespace self.parent

      engine_kls = self
      ActiveSupport.on_load :after_initialize do
        Rails.application.routes.prepend do
          mount engine_kls, at: '/'
        end
      end
    end
  end
end
