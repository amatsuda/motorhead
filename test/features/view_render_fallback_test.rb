require 'test_helper'

class ViewRenderFallbackTest < ActionDispatch::IntegrationTest
  setup do
    ViewRenderFallback::Engine.active_if { true }
  end
  teardown do
    ViewRenderFallback::Engine.active_if { false }
  end

  test 'Wanko extension successfully extends the view' do
    visit '/greeting'
    assert has_content? 'bonjour'
  end
end
