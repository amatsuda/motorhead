class ControllerExtension::GreetingController < ::GreetingController
  include Wanko::Controller

  def show
    @greeting = 'こんにちは'
  end
end
