class GreetingController < ApplicationController
  before_action { @world = 'world' }

  def show
    @greeting = 'hello'
    HelloMailer.hello.deliver_now!
  end
end
