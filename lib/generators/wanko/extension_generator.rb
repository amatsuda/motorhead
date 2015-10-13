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
        options = @options.dup
        options[:mountable] = options[:skip_bundle] = options[:skip_test_unit] = options[:skip_git] = options[:skip_gemfile] = true
        @options = options.freeze
      end
    end
  end
end
