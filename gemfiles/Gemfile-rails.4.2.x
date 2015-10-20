source 'https://rubygems.org'

gemspec :path => '../'

gem 'rails', '~> 4.2.4'
gem 'controller_extension', path: '../test/dummy_app/app/extensions/controller_extension'
gem 'controller_fallback', path: '../test/dummy_app/app/extensions/controller_fallback'
gem 'view_render_fallback', path: '../test/dummy_app/app/extensions/view_render_fallback'
gem 'routes_fallback', path: '../test/dummy_app/app/extensions/routes_fallback'
