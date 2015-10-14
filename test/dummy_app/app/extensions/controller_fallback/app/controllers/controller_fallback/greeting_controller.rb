class ControllerFallback::GreetingController < ::GreetingController
  include Wanko::Controller

  def show
    @greeting = 'hamatai'
    raise 'OMG!'
  end
end
