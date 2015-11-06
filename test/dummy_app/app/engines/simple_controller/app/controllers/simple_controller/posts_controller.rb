class SimpleController::PostsController < ActionController::Base
  include Motorhead::Controller

  def index
    render text: 'POSTS'
  end
end
