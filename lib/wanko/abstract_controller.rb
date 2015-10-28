module Wanko
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
      helper Wanko::Helpers::UrlHelper
    end
  end

  module AbstractController
    def send_action(method_name, *args)
      if self.is_a?(Wanko::Controller)
        begin
          super
          @_wanko_action_successfully_finished = true
          env['wanko_view_assigns'] = view_assigns
        rescue => e
          (self.class.parent::Engine.on_error || Wanko.config.on_error).call(e)
        end
      else
        if env.key? 'wanko_render_result'
          headers.delete 'X-Cascade'
          ret = env.delete 'wanko_render_result'
          self.response_body = ret
        else
          super
        end
      end
    end
  end

  module ActionController
    def process_action(*args)
      if self.is_a?(Wanko::Controller)
        headers['X-Cascade'] = 'pass'
        if self.class.parent::Engine.active?(self)
          super
        end
      else
        super
      end
    end

    def view_assigns
      if env.key? 'wanko_view_assigns'
        super.merge env['wanko_view_assigns']
      else
        super
      end
    end

    def render_to_body(options = {})
      return if (headers['X-Cascade'] == 'pass') && !defined?(@_wanko_action_successfully_finished)
      env['wanko_render_result'] = super
    end
  end
end

AbstractController::Base.prepend Wanko::AbstractController
ActionController::Base.prepend Wanko::ActionController
