ActionView::Base.class_eval do
  #FIXME FIXHAML AMCing here because prepending on `render` causes infinite loop when Haml is bundled
  def render_with_motorhead(options = {}, locals = {}, &block)
    if (Hash === options) && options.key?(:extension)
      ext_name = options[:extension][/[^\/]*/]
      if ext_name.classify.constantize::Engine.active? controller
        return view_renderer.render(self, options, &block)
      else
        return capture(&block)
      end
    end
    render_without_motorhead options, locals, &block
  end

  alias_method_chain :render, :motorhead
end

module Motorhead
  module ActionView
    module Renderer
      def render(context, options, &block)
        if options.key? :extension
          render_extension(context, options, &block)
        else
          super
        end
      end

      def render_extension(context, options, &block)
        partial_name = options.delete :extension
        Motorhead::ExtensionRenderer.new(@lookup_context).render(context, options.merge(partial: partial_name), block)
      end
    end
  end

  class ExtensionRenderer < ::ActionView::PartialRenderer
    def render(context, options, block)
      super
    rescue => e
      ext_name = options[:partial][/[^\/]*/]
      (ext_name.classify.constantize::Engine.on_error || Motorhead.config.on_error).call(e)
      context.capture(&block)
    end
  end
end

ActionView::Renderer.prepend Motorhead::ActionView::Renderer
