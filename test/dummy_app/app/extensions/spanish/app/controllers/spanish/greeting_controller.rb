class Spanish::GreetingController < ::GreetingController
  include Wanko::Controller

  def show
    @spanish = 'hola'
  end
end
