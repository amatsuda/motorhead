# frozen_string_literal: true
class ControllerExtension::GreetingController < ::GreetingController
  include Motorhead::Controller

  def show
    @greeting = 'こんにちは'
  end
end
