# frozen_string_literal: true
require 'test_helper'

class ControllerFallbackTest < ActionDispatch::IntegrationTest
  setup do
    ControllerFallback::Engine.active_if { true }
  end
  teardown do
    ControllerFallback::Engine.active_if { false }
  end

  test 'successfully falls back to the original action method on error in an engine' do
    visit '/greeting'
    assert has_content? 'hello'
  end
end
