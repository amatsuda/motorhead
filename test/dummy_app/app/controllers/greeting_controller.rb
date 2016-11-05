# frozen_string_literal: true
class GreetingController < ApplicationController
  before_action { @world = 'world' }

  def show
    @greeting = 'hello'
    HelloMailer.hello.deliver_now!
  end
end
