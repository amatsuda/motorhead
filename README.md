# Wanko

Wanko is a prototyping framework for Rails.
It's something akin to "feature toggle".
It can be used for "A/B testing" as well.
But essentially, the main purpose of this framework is to provide a way to rapidly and safely deliver new features to the production environment.


## Installation

Bundle into your Rails app.


## Features

### Isolated Engine

Wanko helps you mounting Isolated Engines called "extensions" onto the main Rails app.
An extension can contain whole MVC conponents, which means that you can encapsulate everything that are needed for your new feature under one single directory.
This helps your team creating multiple new features simultaneously without causing code conflict.

### Conditional Execution

Each Wanko extension can be configured to be enabled/disabled.
The condition is not just a flag but can be a Ruby Proc which will be dynamically evaluated on each request in the controller context.

### Error-proof

If any RuntimeError happens inside an extension on the production environment, Wanko absorbs the error and executes the appropriate fallback code so that the end users would never even notice the occurrence of the error.

### Extending Action Methods in the Main App

Wanko provides an interface to override the main app's controller actions.

### Partially Extending Views in the Main App

Wanko provides a hook to partially overwrite any part of your existing view.


## Structure

    main_app
    ├── Gemfile
    ├── Gemfile.lock
    ├── Rakefile
    ├── app
    │   ├── assets
    │   ├── controllers
    │   ├── extensions
    │   │   ├── my_awesome_new_feature
    │   │   │   ├── app
    │   │   │   │   ├── assets
    │   │   │   │   ├── controllers
    │   │   │   │   │   └── my_awesome_new_feature
    │   │   │   │   │       └── welcome_controller.rb
    │   │   │   │   ├── helpers
    │   │   │   │   │   └── my_awesome_new_feature
    │   │   │   │   │       └── welcome_helper.rb
    │   │   │   │   ├── mailers
    │   │   │   │   ├── models
    │   │   │   │   └── views
    │   │   │   │       ├── layouts
    │   │   │   │       │   └── my_awesome_new_feature
    │   │   │   │       │       └── application.html.erb
    │   │   │   │       └── my_awesome_new_feature
    │   │   │   │           └── welcome
    │   │   │   ├── config
    │   │   │   │   └── routes.rb
    │   │   │   ├── lib
    │   │   │   │   ├── my_awesome_new_feature
    │   │   │   │   │   └── engine.rb
    │   │   │   │   ├── my_awesome_new_feature.rb
    │   │   │   │   └── tasks
    │   │   │   ├── my_awesome_new_feature.gemspec
    │   │   │   └── test
    │   │   └── yet_another_new_feature
    │   │       ├── app
    │   │       ...
    │   ├── helpers
    │   ├── mailers
    │   ├── models
    │   └── views
    ├── bin
    ├── config
    ├── db
    ...


## Components

### lib/EXTENSION\_NAME/engine.rb

Put `active_if` directive inside the Engine class. The whole extension will only be executed if the block is evaluated to be truthy on runtime.

Example:

```ruby
# app/extensions/my_awesome_new_feature/config/routes.rb
module MyAwesomeNewFeature
  class Engine < ::Rails::Engine
    include Wanko::Engine

    # this whole extension will be executed only when logged in as admin users
    active_if { current_user.admin? }
  end
end
```

### routes.rb

All routes in extensions' routes.rb will be automatically prepended to the main app's Routes.


### Controllers

Controllers can be a normal Engine controller.
Or, you can craft a controller class inheriting a controller that exists in the main app, and overriding some action methods.
From inside the actions in extensions, you can call the main app's action via `super`.

Example:

```ruby
# app/extensions/my_awesome_new_feature/app/controllers/my_awesome_new_feature/welcome_controller.rb
class MyAwesomeNewFeature::WelcomeController < ::WelcomeController
  include Wanko::Controller

  def index
    # invoking the main app's action first
    super

    # adding some more business logic
    @notifications = Notification.for current_user
  end
end
```


### Views

When an extension renders the views, it looks up app/views/EXTENSION\_NAME/ directory first, then the main app's view directory next. This way you can overwrite views per template/partial file.
Also, Wanko adds new `:extension` option to `render` method, which enables you to explicitly inject a piece of HTML from an extension into any place of the app.
`render :extension` takes an `EXTENSION_NAME/view_path' parameter.

Example:

```haml
# app/extensions/my_awesome_new_feature/app/views/my_awesome_new_feature/welcome/_index.html.haml
.new_feature
  Some contents for new feature

# app/views/welcome/index.html.haml
= render extension: 'my_awesome_new_feature/welcome/index' do
  Some contents that will be shown by default
```


## Generators

Wanko provides some handy code generators.

### Generating an extension

```ruby
% rails g wanko:extension EXTENSION_NAME
```

Example:

```ruby
% rails g wanko:extension my_awesome_new_feature
```

  This generates an extension Engine in
  ~/app/extensions/my\_awesome\_new\_feature/ directory.

### Generating a controller extention that extends an existing controller

```ruby
% rails g wanko:controller EXTENSION_NAME/CONTROLLER_NAME [action action] [options]
```

Example:

```ruby
% rails g wanko:controller my_awesome_new_feature/welcome index
```

  This generates a controller that extends WelcomeController and implements index action inside ~/app/extensions/my\_awesome\_new\_feature/ directory.

### Generating an extension + controller


```ruby
% rails g wanko:extension EXTENSION_NAME CONTROLLER_NAME [action action] [options]
```

Example:

```ruby
% rails g wanko:extension my_awesome_new_feature welcome index
```

  This generates an extension Engine in ~/app/extensions/my\_awesome\_new\_feature/ directory.  Plus, a controller that extends WelcomeController and implements index action inside the Engine.


## Contributing

Pull requests are welcome on GitHub at https://github.com/amatsuda/wanko.


## Todo

* Better generator

* Model extension

* Documentation


## Special Thanks

This product is deeply inspired by [Chanko](http://cookpad.github.io/chanko/).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
