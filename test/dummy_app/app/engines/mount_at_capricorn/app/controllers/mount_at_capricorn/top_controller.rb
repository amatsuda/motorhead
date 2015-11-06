class MountAtCapricorn::TopController < ActionController::Base
  include Motorhead::Controller

  def show
    render text: 'My life, my heart, black night, my star'
  end
end
