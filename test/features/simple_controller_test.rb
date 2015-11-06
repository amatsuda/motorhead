require 'test_helper'

class SimpleControllerTest < ActionDispatch::IntegrationTest
  setup do
    SimpleController::Engine.active_if { true }
  end
  teardown do
    SimpleController::Engine.active_if { false }
  end

  test 'Motorhead engine successfully extends action methods that has no `super` method' do
    visit '/posts'
    assert has_content? 'POSTS'
  end
end
