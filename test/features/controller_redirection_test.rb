# frozen_string_literal: true
require 'test_helper'

class ControllerRedirectionTest < ActionDispatch::IntegrationTest
  setup do
    Redirector::Engine.active_if { true }
  end
  teardown do
    Redirector::Engine.active_if { false }
  end

  test 'Motorhead engine successfully performs redirect' do
    visit '/greeting2'
    assert has_content? 'hello, world'
  end
end
