class MountAtCapricorn::TopController < ActionController::Base
  include Motorhead::Controller

  def show
    render plain: 'My life, my heart, black night, my star'
  end
end
