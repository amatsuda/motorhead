# frozen_string_literal: true
require 'test_helper'

class ViewRenderFallbackTest < ActionDispatch::IntegrationTest
  setup do
    ViewRenderFallback::Engine.active_if { true }
  end
  teardown do
    ViewRenderFallback::Engine.active_if { false }
  end

  test 'Motorhead engine successfully extends the view' do
    visit '/greeting'
    assert has_content? 'bonjour'
  end

  test 'Motorhead engine falls back to the original view on error' do
    visit '/greeting'
    assert has_content? 'goodbye'
    refute has_content? 'さようなら'
  end
end

class ViewRenderFallbackInactiveTest < ActionDispatch::IntegrationTest
  test 'Inactive Motorhead engine does not extend the view via render :engine' do
    visit '/greeting'
    assert has_content? 'hello'
    refute has_content? 'bonjour'
  end

  test 'Inactive Motorhead engine would not be executed via render :engine' do
    visit '/greeting'
    assert has_content? 'goodbye'
    refute has_content? 'さようなら'
  end
end
