ActionView::Base.class_eval do
  #FIXME FIXHAML AMCing here because prepending on `render` causes infinite loop when Haml is bundled
  def render_with_motorhead(options = {}, locals = {}, &block)
    if (Hash === options) && options.key?(:engine)
      ext_name = options[:engine][/[^\/]*/]
      if ext_name.camelize.constantize::Engine.active? controller
        view_renderer.render(self, options, &block)
      elsif block
        capture(&block)
      end
    else
      render_without_motorhead options, locals, &block
    end
  end

  alias_method_chain :render, :motorhead
end

module Motorhead
  module ActionView
    module Renderer
      def render(context, options, &block)
        if options.key? :engine
          render_engine(context, options, &block)
        else
          super
        end
      end

      def render_engine(context, options, &block)
        partial_name = options.delete :engine
        Motorhead::EngineRenderer.new(@lookup_context).render(context, options.merge(partial: partial_name), block)
      end
    end
  end

  class EngineRenderer < ::ActionView::PartialRenderer
    def render(context, options, block)
      super
    rescue => e
      ext_name = options[:partial][/[^\/]*/]
      (ext_name.camelize.constantize::Engine.on_error || Motorhead.config.on_error).call(e)
      context.capture(&block)
    end
  end
end

ActionView::Renderer.prepend Motorhead::ActionView::Renderer
