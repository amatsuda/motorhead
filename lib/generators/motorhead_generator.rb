require 'rails/generators/rails/plugin/plugin_generator'

class MotorheadGenerator < ::Rails::Generators::PluginGenerator
  class EngineBuilder < ::Rails::PluginBuilder
    def readme() end
    def rakefile() end
  end

  argument :base_controller, type: :string, optional: true, banner: 'base controller'
  argument :actions, type: :array, default: [], banner: "action action"
  source_root ::Rails::Generators::PluginGenerator.source_root

  class << self
    def source_paths
      [File.expand_path('../motorhead/templates', __FILE__), *super]
    end
  end

  def initialize(*args)
    options = args.extract_options!
    options[:destination_root] = 'app/engines'
    super(*args, options)
    options = @options.dup
    options[:mountable] = options[:skip_bundle] = options[:skip_test_unit] = options[:skip_git] = options[:skip_gemfile] = true
    @options = options.freeze
  end

  def get_builder_class
    EngineBuilder
  end

  # override
  def create_bin_files
  end

  def put_litter_in_its_place
    remove_file 'MIT-LICENSE'
    remove_file "app/controllers/#{name}/application_controller.rb"
    remove_file "lib/tasks"
  end

  def untodo_gemspec
    gemspec = "#{name}.gemspec"
    gsub_file gemspec, /"TODO.*?"/, '""'
  end

  def no_dependency
    gemspec = "#{name}.gemspec"
    gsub_file gemspec, /^\s*s\.add_(?:development_)?dependency .*\n/, ''
  end

  def bundle_to_parent
    gemfile = Rails.root + 'Gemfile'
    append_to_file gemfile, "gem '#{name}', path: '#{destination_root.sub(%r(^#{Rails.root}/), '')}'\n" if gemfile.exist?
  end

  def generate_controller
    if base_controller
      Dir.chdir destination_root do
        #FIXME call the controller generator directly
        puts `rails g motorhead:controller #{name}/#{base_controller} #{actions * ' '}`
      end
    end
  end
end
