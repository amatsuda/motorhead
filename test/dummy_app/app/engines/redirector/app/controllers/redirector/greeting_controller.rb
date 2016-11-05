# frozen_string_literal: true
class Redirector::GreetingController < ::GreetingController
  include Motorhead::Controller

  def greeting2
#     redirect_to '/greeting'
  end
end
