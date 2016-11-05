# frozen_string_literal: true
require 'test_helper'

class RoutesFallbackTest < ActionDispatch::IntegrationTest
  setup do
    RoutesFallback::Engine.active_if { true }
  end
  teardown do
    RoutesFallback::Engine.active_if { false }
  end

  test 'URL helpers successfully fall back to the main_app routes' do
    visit '/greeting'
    assert has_content? 'omg_from_view: /omg'
  end
end
