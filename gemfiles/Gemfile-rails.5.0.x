source 'https://rubygems.org'

gemspec :path => '../'

gem 'rails', '~> 5.0.0'
gem 'controller_extension', path: '../test/dummy_app/app/engines/controller_extension'
gem 'controller_fallback', path: '../test/dummy_app/app/engines/controller_fallback'
gem 'view_render_fallback', path: '../test/dummy_app/app/engines/view_render_fallback'
gem 'routes_fallback', path: '../test/dummy_app/app/engines/routes_fallback'
gem 'italian', path: '../test/dummy_app/app/engines/italian'
gem 'spanish', path: '../test/dummy_app/app/engines/spanish'
gem 'simple_controller', path: '../test/dummy_app/app/engines/simple_controller'
gem 'mount_at_capricorn', path: '../test/dummy_app/app/engines/mount_at_capricorn'
gem 'redirector', path: '../test/dummy_app/app/engines/redirector'
