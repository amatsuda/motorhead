class Italian::GreetingController < ::GreetingController
  include Wanko::Controller

  def show
    @italian = 'ciao'
  end
end
