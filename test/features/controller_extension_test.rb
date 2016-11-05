# frozen_string_literal: true
require 'test_helper'

class ControllerExtensionTest < ActionDispatch::IntegrationTest
  setup do
    ControllerExtension::Engine.active_if { true }
  end
  teardown do
    ControllerExtension::Engine.active_if { false }
  end

  test 'Motorhead engine successfully extends action methods' do
    visit '/greeting'
    assert has_content? 'こんにちは, world'
  end
end
