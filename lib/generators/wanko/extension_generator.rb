require 'rails/generators/rails/plugin/plugin_generator'

module Wanko
  module Generators
    class ExtensionGenerator < ::Rails::Generators::PluginGenerator
      source_root ::Rails::Generators::PluginGenerator.source_root

      class << self
        def source_paths
          [File.expand_path('../templates', __FILE__), *super]
        end
      end

      def initialize(*args)
        options = args.extract_options!
        options[:destination_root] = 'app/extensions'
        super(*args, options)
      end
    end
  end
end
