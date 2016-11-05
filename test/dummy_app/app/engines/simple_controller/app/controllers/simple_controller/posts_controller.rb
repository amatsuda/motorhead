# frozen_string_literal: true
class SimpleController::PostsController < ActionController::Base
  include Motorhead::Controller

  def index
    render plain: 'POSTS'
  end
end
