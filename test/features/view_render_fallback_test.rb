require 'test_helper'

class ViewRenderFallbackTest < ActionDispatch::IntegrationTest
  setup do
    ViewRenderFallback::Engine.active_if { true }
  end
  teardown do
    ViewRenderFallback::Engine.active_if { false }
  end

  test 'Motorhead extension successfully extends the view' do
    visit '/greeting'
    assert has_content? 'bonjour'
  end

  test 'Motorhead extension falls back to the original view on error' do
    visit '/greeting'
    assert has_content? 'goodbye'
    refute has_content? 'さようなら'
  end
end

class ViewRenderFallbackInactiveTest < ActionDispatch::IntegrationTest
  test 'Inactive Motorhead extension does not extend the view via render :extension' do
    visit '/greeting'
    assert has_content? 'hello'
    refute has_content? 'bonjour'
  end

  test 'Inactive Motorhead extension would not be executed via render :extension' do
    visit '/greeting'
    assert has_content? 'goodbye'
    refute has_content? 'さようなら'
  end
end
