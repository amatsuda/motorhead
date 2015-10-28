require 'test_helper'

class ViewRenderingTest < ActionDispatch::IntegrationTest
  setup do
    $view_engine_rendered = false
  end

  test 'views in inactive engines are never be rendered' do
    visit '/greeting'
    refute $view_engine_rendered
  end
end
