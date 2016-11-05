# frozen_string_literal: true
class Italian::GreetingController < ::GreetingController
  include Motorhead::Controller

  def show
    @italian = 'ciao'
  end
end
