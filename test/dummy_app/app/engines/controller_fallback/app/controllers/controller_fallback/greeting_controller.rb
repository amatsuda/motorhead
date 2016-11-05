# frozen_string_literal: true
class ControllerFallback::GreetingController < ::GreetingController
  include Motorhead::Controller

  def show
    @greeting = 'hamatai'
    raise 'OMG!'
  end
end
