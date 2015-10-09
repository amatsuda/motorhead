module Wanko
  module AbstractController
    def send_action(method_name, *args)
      if self.is_a?(Wanko::Controller)
        super
        @_wanko_action_successfully_finished = true
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

    def render_to_body(options = {})
      return if (headers['X-Cascade'] == 'pass') && !defined?(@_wanko_action_successfully_finished)
      env['wanko_render_result'] = super
    end
  end
end

AbstractController::Base.prepend Wanko::AbstractController
ActionController::Base.prepend Wanko::ActionController
