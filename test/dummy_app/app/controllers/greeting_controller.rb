class GreetingController < ApplicationController
  before_action { @world = 'world' }

  def show
    @greeting = 'hello'
  end
end
