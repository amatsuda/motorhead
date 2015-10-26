module Wanko
  module ActionView
    module Helpers
      module RenderingHelper
        def render(options = {}, locals = {}, &block)
          if (Hash === options) && options.key?(:extension)
            ext_name = options[:extension][/[^\/]*/]
            if ext_name.classify.constantize::Engine.active? controller
              return view_renderer.render(self, options, &block)
            else
              return capture(&block)
            end
          end
          super
        end
      end
    end

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
        Wanko::ExtensionRenderer.new(@lookup_context).render(context, options.merge(partial: partial_name), block)
      end
    end
  end

  class ExtensionRenderer < ::ActionView::PartialRenderer
    def render(context, options, block)
      super
    rescue => e
      #TODO error handling
      p e
      context.capture(&block)
    end
  end
end

ActionView::Base.prepend Wanko::ActionView::Helpers::RenderingHelper
ActionView::Renderer.prepend Wanko::ActionView::Renderer
