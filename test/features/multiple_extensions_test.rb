# frozen_string_literal: true
require 'test_helper'

class MultipleExtensionsTest < ActionDispatch::IntegrationTest
  setup do
    Italian::Engine.active_if { true }
    Spanish::Engine.active_if { true }
  end
  teardown do
    Italian::Engine.active_if { false }
    Spanish::Engine.active_if { false }
  end

  test 'Motorhead executes all active engines and passes all view_assigns to the view' do
    visit '/greeting'
    assert has_content? 'ciao'
    assert has_content? 'hola'
  end
end
