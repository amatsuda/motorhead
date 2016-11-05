# frozen_string_literal: true
class Spanish::GreetingController < ::GreetingController
  include Motorhead::Controller

  def show
    @spanish = 'hola'
  end
end
