module Motorhead
  module Helpers
    module UrlHelper
      #FIXME there has to be a better way doing this...
      def method_missing(meth, *args, &block)
        if main_app.routes.url_helpers.instance_methods.include? meth
          main_app.send meth, *args, &block
        else
          super
        end
      end
    end
  end

  module Controller
    extend ActiveSupport::Concern

    included do
      helper Motorhead::Helpers::UrlHelper
    end
  end

  module AbstractController
    def send_action(*)
      case self
      when Motorhead::Controller
        begin
          super
          @_motorhead_action_successfully_finished = true
          env['motorhead_view_assigns'] = view_assigns
        rescue => e
          (self.class.parent::Engine.on_error || Motorhead.config.on_error).call(e)
        end
      when ::ActionController::Base
        if env.key? 'motorhead_render_result'
          self.response = env.delete 'motorhead_render_result'
          headers.delete 'X-Cascade'
          self.response_body = response.body
        else
          super
        end
      else  # ActionMailer::Base
        super
      end
    end
  end

  module ActionController
    def process_action(method_name, *args)
      if self.is_a?(Motorhead::Controller) && method(method_name).super_method
        headers['X-Cascade'] = 'pass'
        if self.class.parent::Engine.active?(self)
          super
        end
      else
        super
      end
    end

    def view_assigns
      if env.key? 'motorhead_view_assigns'
        super.merge env['motorhead_view_assigns']
      else
        super
      end
    end

    def render_to_body(options = {})
      return if (headers['X-Cascade'] == 'pass') && !defined?(@_motorhead_action_successfully_finished)
      ret = super
      env['motorhead_render_result'] = response
      ret
    end

    def redirect_to(options = {}, response_status = {}) #:doc:
      ret = super
      env['motorhead_render_result'] = response
      ret
    end
  end
end

AbstractController::Base.prepend Motorhead::AbstractController
ActionController::Base.prepend Motorhead::ActionController
